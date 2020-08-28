Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"

  post "/users/sign_up", to: "users#create"

  resources :items, only: [:new, :show, :edit, :update]

  post 'items/create', to: 'items#create'

  # git push中にネットワークが切れたので再プッシュ用
end