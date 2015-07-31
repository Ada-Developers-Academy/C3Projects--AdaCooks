Rails.application.routes.draw do

  root 'welcome#index'

  get '/search', to: 'application#check_search', as: 'search'

  resources :users, only: [:create]

  get '/register', to: 'users#new', as: 'register'

  get '/users/:user_id/dashboard', to: 'users#dashboard', as: 'dashboard_user'

  get '/users/:user_id/profile', to: 'users#profile', as: 'profile_user'


  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'


  resources :cookbooks, only: [:show]

  resources :users, only: [] do
    resources :recipes, only: [:new, :create, :edit, :update, :destroy]

    resources :cookbooks, only: [:show, :new, :create, :edit, :update, :destroy]

    resources :ingredients, only: [:new, :create, :edit, :update, :index, :destroy]
  end

  delete 'u/:user_id/cb/:cookbook_id/r/:recipe_id/remove', to: 'cookbooks#destroy_recipe_assoc', as: 'destroy_recipe_assoc'

  resources :recipes, only: [:show]

  resources :ingredients, only: [:show]


