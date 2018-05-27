Rails.application.routes.draw do
  resources :disasters, only: %i[index show]
  resources :charities, only: %i[index]
end
