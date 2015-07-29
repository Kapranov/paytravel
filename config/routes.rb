Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :tours
  resources :flights
  root to: 'visitors#index'
end
