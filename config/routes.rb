Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'auth#index'
  # get '/login' => 'auth#index'
  # post '/login' => 'auth#create'
  # get '/logout' => 'auth#destroy'
  get '/register', to: 'users#new'

  resources :tasks
  resources :users
end
