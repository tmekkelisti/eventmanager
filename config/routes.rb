Rails.application.routes.draw do
  resources :locations, except: [:destroy, :edit, :update] do
    resources :comments
  end
  root to: 'events#index'
  resources :events do
    resources :comments
  end
  resources :participations, only: [:create]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
