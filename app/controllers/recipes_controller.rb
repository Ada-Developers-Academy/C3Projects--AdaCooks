class RecipesController < ApplicationController
  def index
    if params[:search]
      @recipes = Recipe.search(params[:search])
    else
      @recipes = Recipe.alpha_order
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
