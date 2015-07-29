class RecipesController < ApplicationController

  def index
    unsorted_recipes = Recipe.all
    @recipes = unsorted_recipes.sort
  end

end
