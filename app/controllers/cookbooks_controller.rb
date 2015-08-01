class CookbooksController < ApplicationController

  def show
    @cookbook = Cookbook.find(params[:id])
  end

  def remove_recipe
    cookbook = Cookbook.find(params[:cookbook_id])
    recipe = Recipe.find(params[:recipe_id])

    cookbook.recipes.delete(recipe)

    redirect_to user_cookbook_path(params[:user_id], params[:cookbook_id])
  end

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.create(cookbook_params)

    redirect_to user_dashboard_path(params[:user_id])
  end

  def edit
    @cookbook = Cookbook.find(params[:id])
  end

  def update
    @cookbook = Cookbook.find(params[:id])
    @cookbook.update(cookbook_params)
    redirect_to user_dashboard_path(params[:user_id])
  end

  def destroy
    @cookbook = Cookbook.find(params[:id])
    @cookbook.destroy

    redirect_to user_dashboard_path(params[:user_id])
  end

######################################################

  private

  def cookbook_params
    params.require(:cookbook).permit(:user_id, :name, :description, :image)
  end

end
