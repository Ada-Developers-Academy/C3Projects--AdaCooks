Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # search
  get "/search" => 'recipes#index'

  resources :users, only: [:show, :new, :create]
  resources :cookbooks
  resources :recipes
  resources :ingredients

  # sessions paths
  get    "/login", to: "sessions#new"
  post   "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"


end
