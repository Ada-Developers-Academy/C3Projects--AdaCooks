Rails.application.routes.draw do
  root 'home#index'

  get '/register', to: 'users#new', as: 'register'
  post '/users', to: 'users#create'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  resources :recipes
  # resources :users, only: [:show] do
  #   resources :cookbooks
  # end
  resources :cookbooks
  delete 'cookbooks/:cookbook_id/recipe/:id/remove/', to: 'cookbooks#remove_recipe', as: 'remove_recipe'
  
  resources :ingredients
  resources :users, except: [:new, :create]
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'

end
