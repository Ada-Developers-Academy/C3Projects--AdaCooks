Rails.application.routes.draw do
  root :to => redirect('/recipes')
  # TODO: research the root redirect more (also research difference between 301 and 302 redirects).
  # It's odd -- root_path --> 'localhost:3000', which does not redirect and change
  # the url. But 'localhost:3000/' DOES redirect and change the URL.

  resources :users, only: [:show, :new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :cookbooks do # cookbooks will always be attached to a user
    post 'remove_recipe', on: :member
  end

  resources :recipes do # recipes aren't necessarily attached to a cookbook
    resources :steps, except: [:index, :show]
  end

  resources :ingredients
end
