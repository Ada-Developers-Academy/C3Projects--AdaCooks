class WelcomeController < ApplicationController
  def index
    @recipes = Recipe.order(:name)
    @ingredients = Ingredient.order(:name)
  end
end
