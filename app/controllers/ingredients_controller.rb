class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.alpha_order
  end



end
