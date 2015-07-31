Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get '/search', to: 'application#check_search', as: 'search'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  resources :users, only: [:create]
  #do
  #   member do
  #     get 'dashboard'
  #     get 'profile'
  #   end
  # end
  get '/register', to: 'users#new', as: 'register'

  get '/users/:user_id/dashboard', to: 'users#dashboard', as: 'dashboard_user'

  get '/users/:user_id/profile', to: 'users#profile', as: 'profile_user'


  # resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'


  resources :cookbooks, only: [:show]

  resources :users, only: [] do
    resources :recipes, only: [:new, :create, :edit, :update, :destroy]

    resources :cookbooks, only: [:show, :new, :create, :edit, :update, :destroy]

    resources :ingredients, only: [:new, :create, :edit, :update, :index, :destroy]
  end

  delete 'u/:user_id/cb/:cookbook_id/r/:recipe_id/remove', to: 'cookbooks#destroy_recipe_assoc', as: 'destroy_recipe_assoc'

  resources :recipes, only: [:show]

  resources :ingredients, only: [:show]



  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
