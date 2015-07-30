class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create 
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      session[:recipe_id] = @recipe.id
      redirect_to new_user_ingredient_path(session[:user_id])
    else
      render :new
    end
  end

private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions, :image, :user_id)
  end


end
