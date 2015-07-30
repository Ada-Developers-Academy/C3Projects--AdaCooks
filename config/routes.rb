Rails.application.routes.draw do
  root 'home#root'
  post "/", to: "home#search"

  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#logout"
  get "/signup", to: "users#signup"
  post "/signup", to: "users#create"

  resources :recipes, only: [:index, :show]
  resources :ingredients, only: [:index, :show]

  resources :users, only: [] do
    get "", to: "users#show", as: "" # OPTIMIZE: Figure this out later
    resources :cookbooks do
      post "recipes/:id", to: "cookbooks#add_recipe", as: "recipe"
      delete "recipes/:id", to: "cookbooks#remove_recipe"
    end
    resources :ingredients, only: [:new, :create, :edit, :update, :destroy]
    resources :recipes, only: [:new, :create, :edit, :update, :destroy]
  end
end
