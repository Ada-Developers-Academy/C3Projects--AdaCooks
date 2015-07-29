class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)

    if @recipe.save
      redirect_to dashboard_user_path(session[:user_id])
    else
      flash.now[:error] = "Please enter valid stuff"

      redirect_to :back
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name, :description, :preparation,
      :user_id)
  end
end
