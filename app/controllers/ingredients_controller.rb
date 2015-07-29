class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.alpha_order
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

end
