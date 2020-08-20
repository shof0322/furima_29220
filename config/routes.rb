Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"
  # resources :users

  post "/users/sign_up", to: "users#create"
end