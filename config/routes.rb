Rails.application.routes.draw do

  get 'auth/google_oauth2/callback', to: 'sessions#google_auth'
  get 'auth/failure', to: 'sessions#new'

  #signup
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#show'
  

  #sessions routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#new'

  resources :tasks

  root to: 'sessions#new'

end