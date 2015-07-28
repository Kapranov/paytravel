Rails.application.routes.draw do
  resources :tours
  resources :flights
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
