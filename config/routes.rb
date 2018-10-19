Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  namespace :admin do
    resources :drivers do
      resources :violation_tickets, except: [:index, :destroy]
      resources :licenses, except: [:index, :destroy]
    end
    resources :customers, except: [:destroy] do
      resources :customer_locations, except: [:indxe, :destroy]
    end
    resources :locations, except: [:destroy]
    resources :equipment do
      resources :notes, except: [:index, :show]
      resources :permits
    end
    resources :vendors do
      resources :notes, except: [:index, :show]
    end
    resources :loads do
      resources :pickup_locations
      resources :drop_locations
    end
  end
end
