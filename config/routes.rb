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

  %w( 404 422 500 ).each do |code|
    get code, :to => "error#show", :code => code
  end

  root to: 'visitors#index'

end
