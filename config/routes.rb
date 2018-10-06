Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  namespace :admin do
    resources :drivers do
      resources :violation_tickets, except: [:index, :destroy]
      resources :licenses, except: [:index, :destroy]
    end
    resources :companies, except: [:destroy] do
      resources :locations, except: [:index, :destroy]
    end
    resources :equipment do
      resources :notes, except: [:index, :show]
      resources :permits
    end
  end
end
