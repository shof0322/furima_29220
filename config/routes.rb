Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"

  post "/users/sign_up", to: "users#create"

  resources :items, only: [:new, :show, :edit, :update, :destroy] do
    resources :purchases, only:[:create, :index]
  end

  post 'items/create', to: 'items#create'

  resources :buyers, only:[:create]

end