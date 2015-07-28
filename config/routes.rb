Rails.application.routes.draw do
  root 'home#index'
  
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  # Custom Routes
  get    "/login", to: "sessions#new"
  post   "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
