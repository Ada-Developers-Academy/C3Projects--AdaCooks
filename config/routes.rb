Rails.application.routes.draw do
  root 'home#root'

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create"

  resources :recipes, only: [:index, :show, :new]
  resources :ingredients, only: [:index, :show]

  resources :users, only: [:show] do
    resources :cookbooks, only: [:index, :show]
  end
end
