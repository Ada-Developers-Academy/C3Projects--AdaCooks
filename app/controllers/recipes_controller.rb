class RecipesController < ApplicationController
  def index
    @recipes = Recipe.alpha_order
  end
end
