class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]

  def index
    if params[:search]
      @recipes = Recipe.search_by_ingredient(params[:search]).by_name
    else
      @recipes = Recipe.by_name
    end
  end

  def show
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
end
