Rails.application.routes.draw do
  root 'home#root'
  resources :users, only: [:show]
  resources :recipes, only: [:index, :show, :new]
  resources :ingredients, only: [:index, :show]
end
