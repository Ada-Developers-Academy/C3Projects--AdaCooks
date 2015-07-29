class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.alpha_order
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
