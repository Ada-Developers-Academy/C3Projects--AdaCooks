Rails.application.routes.draw do
  root 'home#root'

  resources :recipes, only: [:index, :show, :new]
  resources :ingredients, only: [:index, :show]

  resources :users, only: [:show] do
    resources :cookbooks, only: [:index, :show]
  end
end
