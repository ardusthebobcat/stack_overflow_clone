Rails.application.routes.draw do
  get '/' => 'home#index'

  resources :users

  resources :sessions, :only => [:new, :create, :destroy]
end
