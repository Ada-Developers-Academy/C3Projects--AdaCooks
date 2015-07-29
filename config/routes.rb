Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:show, :new, :create] do
    get 'dash', on: :member
    resources :recipes, only: [:index]
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :cookbooks # cookbooks will always be attached to a user

  resources :recipes do # recipes aren't necessarily attached to a cookbook
    resources :steps, except: [:index, :show]
  end

  resources :ingredients

  # TODO: MAY NEED MEASUREMENT ROUTE?
end
