Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'buildings/index'
  # get 'buildings/new', to: 'buildings#new'
  # post 'buildings', to: 'buildings#create'
  resources :buildings, only: [:index, :new, :create]

  # get 'apartments/index'
  # get 'apartments/new', to: 'apartments#new'
  # post 'apartments', to: 'apartments#create'
  resources :apartments, only: [:index, :new, :create]

  root 'buildings#index'
end
