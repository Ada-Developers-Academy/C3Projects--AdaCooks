class RecipesController < ApplicationController
  def index
    @recipes = Recipe.alpha_order
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    user = User.find(recipe.user_id)

    redirect_to user_path(user)
  end
end
