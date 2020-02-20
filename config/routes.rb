Rails.application.routes.draw do

  root 'application#home'

  get '/register', to: 'users#new' 
  
  resources :users, only:[:index, :new, :show]

end