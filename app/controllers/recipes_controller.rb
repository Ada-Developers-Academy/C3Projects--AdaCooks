class RecipesController < ApplicationController
  def index
    @recipes = Recipe.by_name
  end
end
