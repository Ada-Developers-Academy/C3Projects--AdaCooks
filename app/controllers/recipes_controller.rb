class RecipesController < ApplicationController
  def index
    @recipies = Recipe.all
  end
end
