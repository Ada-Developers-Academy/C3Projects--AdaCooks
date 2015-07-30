Rails.application.routes.draw do
  root 'home#root'

  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#logout"
  get "/signup", to: "users#signup"
  post "/signup", to: "users#create"

  resources :recipes, only: [:index, :show, :new]
  resources :ingredients, only: [:index, :show]

  resources :users, only: [] do
    get "", to: "users#show", as: "" # OPTIMIZE: Figure this out later
    resources :cookbooks do
      delete "recipes/:id", to: "cookbooks#remove_recipe", as: "recipe"
    end
  end
end
