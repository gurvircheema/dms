Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  namespace :admin do
    resources :drivers do
      resources :violation_tickets, except: [:index]
    end
  end
end
