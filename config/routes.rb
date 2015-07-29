Rails.application.routes.draw do  
  root 'home#index'
  
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  resources :cookbooks
  resources :recipes
  resources :ingredients

  # Custom Routes
  get    "login"  => "sessions#new"
  post   "login"  => "sessions#create"
  delete "logout" => "sessions#destroy"

  # Search
  get "/recipes_/search_results" => "recipes#search"
end
