class CookbooksController < ApplicationController

before_action :select_cookbook, only: [:show, :edit, :destroy]

def select_cookbook
  @cookbook = Cookbook.find(params[:id])
end

def index
  @cookbooks = Cookbook.order(:name)
end

def show
end

def new
  @cookbook = Cookbook.new
end

def create
  @cookbook = Cookbook.create(cookbook_params)
  
  redirect_to
end

def edit
end

def update
  @cookbook.update(cookbook_params)

  redirect_to
end

def destroy
  @cookbook.destroy

  redirect_to
end

private
#params ------------------------------------------------------------------------------

def cookbook_params
  params.require(:cookbook).permit(:name, :user_id, :recipe_id)
end

end
