Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"

  post "/users/sign_up", to: "users#create"
end