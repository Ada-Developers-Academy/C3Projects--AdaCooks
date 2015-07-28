Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:show, :new] do
    get 'dash', on: :member
  end

  resources :sessions, only: [:create, :destroy]

  resources :cookbooks # cookbooks will always be attached to a user

  resources :recipes do # recipes aren't necessarily attached to a cookbook
    resources :steps, except: [:index, :show]
  end

  resources :ingredients

  # TODO: MAY NEED MEASUREMENT ROUTE?
end
