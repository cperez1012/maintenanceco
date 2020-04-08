Rails.application.routes.draw do

  get '/auth/google_oauth2/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: 'sessions#new'

  #signup
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#show'
  

  #sessions routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  #tasks routes
  # get '/tasks', to: 'tasks#index'
  # get '/tasks', to: 'tasks#new'
  # post '/tasks', to: 'tasks#create'
  # get '/tasks/:id/edit', to: 'tasks#edit'
  # get '/tasks/:id', to: 'tasks#show'
  # patch '/tasks/:id', to: 'tasks#update'

  resources :tasks
  
  root to: 'sessions#new'

end