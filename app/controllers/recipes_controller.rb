class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create 
    @recipe = Recipe.create(recipe_params)
  end

private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions, :image, :user_id)
  end


end
