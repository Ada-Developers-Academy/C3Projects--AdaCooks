Rails.application.routes.draw do
  resources :users, only: [:show]
  resources :recipes, only: [:index, :show]
end
