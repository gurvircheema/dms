require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
    mount PgHero::Engine, at: 'pghero'
  end

  root to: 'home#index'
  namespace :admin do
    resources :companies, only: [:show, :edit, :update]
    resources :drivers do
      resources :violation_tickets, except: [:index, :destroy]
      resources :licenses, except: [:index, :destroy]
    end
    resources :customers, except: [:destroy] do
      resources :customer_locations, only: [:new, :create, :destroy]
    end
    resources :locations, except: [:destroy]
    resources :equipment do
      resources :notes, except: [:index, :show, :destroy]
      resources :permits, except: [:index, :show]
    end
    resources :vendors do
      resources :notes, except: [:index, :show]
    end
    resources :loads do
      resources :pickup_locations, only: [:new, :create, :destroy]
      resources :drop_locations, only: [:new, :create, :destroy]
    end
    resources :load_confirmations, only: [:show] do
      member do
        post :email
      end
    end
    resources :users, except: [:show]
  end

  match '*path', to: 'application#index', via: :all
end
