Rails.application.routes.draw do

  #session routes
  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'

  resources :sessions

  #users routes
  # get '/signup', to: 'users#new'
  # get '/users/:id', to: 'users#show', as: 'user'
  resources :users

  resources :tasks
  
  resources :tenants

  get '/auth/:provider/callback', to: 'users#create_google'
  get 'auth/failure', to: redirect('/')
  
  root 'static#home'
end