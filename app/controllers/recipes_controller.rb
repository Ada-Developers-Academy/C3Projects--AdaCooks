class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.user_id = session[:user_id]

    if @recipe.save
        redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :image, {:cookbook_ids => [] })
  end
end
