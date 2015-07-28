Rails.application.routes.draw do
  root 'home#index'

  get '/register', to: 'users#new', as: 'register'
  post '/users', to: 'users#create'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'signout'
end
