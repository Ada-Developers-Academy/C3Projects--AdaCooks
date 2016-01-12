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
  get    "/ingredients_/search_results" => "ingredients#search"
  get    "/ingredient_check"            => "ingredients#ingredient_check", as: "ingredient_index"

  get    "remove_recipe" => "cookbooks#rm_recipe", as: "remove_recipe"
end
