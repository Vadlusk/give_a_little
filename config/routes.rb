Rails.application.routes.draw do
  resources :disasters, only: %i[index]
end
