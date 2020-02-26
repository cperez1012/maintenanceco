Rails.application.routes.draw do

  #session routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #users routes
  get '/signup', to: 'users#new'
  get '/users/:id', to: 'users#show', as: 'user'
  # resources :users, only: [:new, :show, :index, :edit]
  
  root 'static#home'
end