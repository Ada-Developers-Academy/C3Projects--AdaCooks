class RecipesController < ApplicationController
  def index
    if params[:search]
      @recipes = Recipe.search(params[:search])
    else
      @recipes = Recipe.alpha_order
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(valid_recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      flash.now[:errors] = ERRORS[:new_recipe_error]
      render :new
    end
  end

  private

  def valid_recipe_params
    params.require(:recipe).permit(:name, :preparation, :user_id)
  end
end
