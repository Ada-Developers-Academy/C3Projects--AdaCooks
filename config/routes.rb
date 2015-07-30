Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # new session, create session, destroy session
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :users, only: [ :show, :new, :create ] do
    resources :cookbooks
  end

  resources :recipes
  resources :ingredients

  patch "/unassociate_recipe/:recipe_id/cookbook/:id", to: "cookbooks#unassociate", as: "unassociate_recipe"
  put "/unassociate_recipe/:recipe_id/cookbook/:id", to: "cookbooks#unassociate"

end
