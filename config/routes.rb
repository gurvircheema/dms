require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
    mount PgHero::Engine, at: 'pghero'
  end

  root to: 'home#index'
  get 'qb/authenticate', to: 'oauth#authenticate'
  get 'qb/oauth_callback', to: 'oauth#oauth_callback'
  get 'qb/success_callback', to: 'oauth#success'
  namespace :admin do
    resources :companies, only: %i[show edit update]
    resources :drivers do
      resources :violation_tickets, except: %i[index destroy]
      resources :licenses, except: %i[index destroy]
    end
    resources :customers, except: [:destroy] do
      resources :customer_locations, only: %i[new create destroy]
    end
    resources :locations, except: [:destroy]
    resources :equipment do
      resources :notes, except: %i[index show destroy]
      resources :permits, except: %i[index show]
    end
    resources :vendors do
      resources :notes, except: %i[index show]
    end
    resources :loads do
      resources :pickup_locations, only: %i[new create destroy]
      resources :drop_locations, only: %i[new create destroy]
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
