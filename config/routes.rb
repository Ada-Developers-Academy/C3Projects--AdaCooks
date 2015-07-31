Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'users#index'

  resources :users do
    resources :cookbooks, only: [:index, :new, :create]
  end

  get "/recipes/search_results" => "ingredients#search"

  resources :cookbooks
  get "cookbooks/:id/remove_recipe" => "cookbooks#remove_recipe", as: :remove_recipe_from_cookbook
  resources :recipes, :ingredients
  resources :sessions, :recipe_ingredients, only: [:new, :create, :destroy]

  post 'recipes/new/add_ingredient_field' => 'recipes#add_ingredient_field', as: 'add_ingredient_field'
  delete 'recipes/new/remove_ingredient_field/:id' => 'recipes#destroy_ingredient', as: 'delete_recipe_ingredient'

  post 'recipes/:id/edit/add_ingredient_field' => 'recipes#add_ingredient_field'
  delete 'recipes/:recipe_id/edit/remove_ingredient_field/:id' => 'recipes#destroy_ingredient'



  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
