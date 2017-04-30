Rails.application.routes.draw do

  root 'home#index'

  resources :users

  resources :posts do
    resources :comments
  end

  get '/login' => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
end
