Rails.application.routes.draw do
  get '/' => 'home#index'
  get '/admin' => 'admin#index'

  resources :sessions, only: [:new, :create, :destroy]

  resources :users

  resources :posts do
    resources :answers
  end
end
