Rails.application.routes.draw do

  devise_for :users

  resources :users

  resources :tours do
    member do
      get :mail_send
    end
  end

  resources :flights do
    member do
      get :mail_send
    end
  end

  root to: 'visitors#index'

end
