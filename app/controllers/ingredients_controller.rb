class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show]

  def index
    @ingredients = Ingredient.by_name
  end

  def show
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
end
