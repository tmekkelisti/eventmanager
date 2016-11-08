Rails.application.routes.draw do
  resources :locations, except: [:destroy, :edit, :update]
  root to: 'events#index'
  resources :events
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
