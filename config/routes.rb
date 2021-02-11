Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'apartments/new', to: 'apartments#new'
  post 'apartments', to: 'apartments#create'

  root 'apartments#index'
end
