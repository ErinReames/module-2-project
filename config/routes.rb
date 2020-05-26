Rails.application.routes.draw do
  resources :pets, only: [:index, :show]
  resources :stores, only: [:index, :show]
  resources :users
  resources :appointments, only: [:index, :show, :new, :create]
  resources :reviews, only: [:index, :show, :new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
