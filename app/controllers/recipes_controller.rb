class RecipesController < ApplicationController
  def index
    @recipes = Recipe.alpha_order
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
