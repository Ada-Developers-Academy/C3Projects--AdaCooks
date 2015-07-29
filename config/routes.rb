Rails.application.routes.draw do
  resources :users, only: [:show] do
    resources :cookbooks, only: [:index, :show]
  end
  resources :recipes, only: [:index, :show]
  resources :ingredients, only: [:index, :show]
end
