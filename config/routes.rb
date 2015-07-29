Rails.application.routes.draw do
  root 'home#index'

  get '/register', to: 'users#new', as: 'register'
  post '/users', to: 'users#create'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  resources :recipes
  resources :users, only: [:show] do
    resources :cookbooks
  end

  delete 'cookbooks/:cookbook_id/recipes/:id/remove', to: 'cookbooks#remove_recipe', as: 'remove_recipe'
end
