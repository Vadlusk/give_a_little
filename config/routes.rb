Rails.application.routes.draw do
  root 'welcome#index'

  resources :disasters, only: %i[index show]
  resources :charities, only: %i[index]
  resources :donations, only: %i[new]
  resources :users,     only: %i[edit update]

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/twitter',          as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'

  get '/auth/google_oauth2',          as: :google_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'

  get '/dashboard', to: 'users#show'
  get '/register',  to: 'users#new'
  post '/register', to: 'users#create'

  get '/tweets', to: 'tweets#new'

  namespace :api do
    namespace :v1 do
      post '/donations', to: 'donations#create'
    end
  end
end
