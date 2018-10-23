Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  namespace :admin do
    resources :drivers do
      resources :violation_tickets, except: [:index, :destroy]
      resources :licenses, except: [:index, :destroy]
    end
    resources :customers, except: [:destroy] do
      resources :customer_locations, only: [:new, :create]
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
  end

  match '*path', to: 'application#index', via: :all
end
