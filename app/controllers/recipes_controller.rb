class RecipesController < ApplicationController
  def index # TODO: add test
    @recipes = Recipe.all # TODO: add test
  end
end
