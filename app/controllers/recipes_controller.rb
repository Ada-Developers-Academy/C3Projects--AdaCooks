class RecipesController < ApplicationController
  def index
    @recipes = Recipe.alpha_order
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def create_params
    params.permit(recipe: [:name, :description, :image, :preparation,
      :cookbook_id])
  end
end
