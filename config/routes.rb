Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"

  post "/users/sign_up", to: "users#create"

  resources :items, only: :new

  post 'items/create', to: 'items#create'
end