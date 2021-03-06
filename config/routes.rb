Rails.application.routes.draw do

  get 'auth/github/callback', to: 'sessions#github_auth'
  get 'auth/google_oauth2/callback', to: 'sessions#google_auth'
  
  get 'auth/failure', to: 'sessions#new'

  #signup
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#profile'

  resources :users, only: [:index, :show] do
    resources :lists, only: [:show]
  end
  #sessions routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources:lists do
    resources :tasks
    resources :comments
  end
  
  root to: 'sessions#new'

end
