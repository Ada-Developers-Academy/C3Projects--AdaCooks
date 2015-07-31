class CookbooksController < ApplicationController

before_action :select_cookbook, only: [:show, :edit, :destroy, :update]

def select_cookbook
  @cookbook = Cookbook.find(params[:id])
end

def index
  @cookbooks = Cookbook.order(:name)

  # @unique_ing = @cookbook.recipes.ingredients.where(recipe_id.count = 1) #change to a scope

end

def show
  @recipes = @cookbook.recipes
end

def new
  @cookbook = Cookbook.new
end

def create
  @cookbook = Cookbook.create(cookbook_params)
  
  redirect_to user_cookbooks_path(session[:user_id])
end

def edit
end

def update
  @cookbook.update(cookbook_params)

  redirect_to user_cookbooks_path(session[:user_id], params[:id])
end


def destroy
  @cookbook.destroy

  redirect_to user_cookbooks_path(session[:user_id])
end

private
#params ------------------------------------------------------------------------------

def cookbook_params
  params.require(:cookbook).permit(:name, :user_id, :recipe_id, :description)
end

end
