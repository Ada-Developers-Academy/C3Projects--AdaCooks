class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all.order('name ASC')
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = Ingredient.find(params[:id]).recipes
  end



end
