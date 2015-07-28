class HomeController < ApplicationController
  def root
    @random_ingredient = Ingredient.all.sample
    @random_recipe = Recipe.all.sample
  end
end
