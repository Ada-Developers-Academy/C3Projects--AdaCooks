class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)

    redirect_to dashboard_user_path(session[:user_id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name, :description, :preparation,
      :user_id)
  end
end
