class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
    @ingredients = Ingredient.order(:name)
  end
end
