class CookbooksController < ApplicationController

before_action :select_cookbook, only: [:show, :edit, :update, :destroy]

def select_cookbook
  @cookbook = Cookbook.find(params[:id])
end

def index
  @cookbooks = Cookbook.order(:name)
  

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
  @cookbook = Cookbook.find(params[:id])
  @cookbook.destroy

  redirect_to user_cookbooks_path(session[:user_id])
end

private
#params ------------------------------------------------------------------------------

def cookbook_params
  params.require(:cookbook).permit(:name, :user_id, :recipe_id, :description)
end

end
