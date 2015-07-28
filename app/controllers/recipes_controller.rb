class RecipesController < ApplicationController

  def index
    # @recipes = Recipe.all
    # raise


    @recipes = Recipe.order(:name)
  end

end
