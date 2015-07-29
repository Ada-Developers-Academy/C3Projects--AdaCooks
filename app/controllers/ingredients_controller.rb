class IngredientsController < ApplicationController

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = @ingredient.recipes
  end
end
