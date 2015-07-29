class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :image, :preparation, :user_id)
  end

end
