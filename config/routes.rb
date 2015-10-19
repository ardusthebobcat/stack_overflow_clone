Rails.application.routes.draw do
  get '/' => 'home#index'

  resources :sessions, only: [:new, :create, :destroy]

  resources :users

  resources :posts
end
