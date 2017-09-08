Rails.application.routes.draw do

  root 'welcome#home'

  resources :users 
  resources :rides
  resources :attractions
  resources :sessions
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end