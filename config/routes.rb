Rails.application.routes.draw do
  resources :disasters, only: %i[index show]
  resources :charities, only: %i[index]
  resources :donations, only: %i[new]

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  get '/logout',    to: 'sessions#destroy'

  get '/auth/twitter', as: :twitter_login

  get '/dashboard', to: 'users#show'
  get '/register',  to: 'users#new'
  post '/register', to: 'users#create'
end
