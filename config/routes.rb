Rails.application.routes.draw do

  # get 'visitors/index'

  devise_for :users

  resources :users

  resources :visitors, only: :index do
    match 'search' => 'visitors#search', on: :collection, via: [:get, :post], as: :search
  end

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
