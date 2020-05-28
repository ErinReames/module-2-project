Rails.application.routes.draw do
  resources :pets, only: [:index, :show]
  resources :stores, only: [:index, :show]
  resources :users
  resources :appointments, only: [:index, :show, :new, :create]
  resources :reviews, only: [:index, :show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  # Welcome/Login/Logut Routes
  root to: "static#mission"
  get "/signup", to: "users#new", as: "signup"
  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
