Rails.application.routes.draw do
  root 'home#index'

  get '/register', to: 'users#new', as: 'register'
  post '/users', to: 'users#create'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  resources :recipes

  resources :cookbooks
  delete 'cookbooks/:cookbook_id/recipe/:id', to: 'cookbooks#remove_recipe', as: 'remove_recipe'
  
  resources :ingredients
  
  resources :users, except: [:new, :create]
  get 'my_recipes', to: 'users#my_recipes', as: 'my_recipes'
  get 'my_cookbooks', to: 'users#my_cookbooks', as: 'my_cookbooks'
  get 'my_ingredients', to: 'users#my_ingredients', as: 'my_ingredients'

end
