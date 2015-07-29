class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show, :destroy]


  def index
    @recipes = Recipe.all
  end

  def show
    @ingredient_lines = @recipe.recipe_ingredients
  end

  def new
    @recipe = Recipe.new
    @recipe_ingredients = @recipe.recipe_ingredients.build
    @recipe_id = Recipe.last.id + 1
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

  def edit
    @recipe_name = @recipe.name.titlecase
  end

  def update
    @recipe.update(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.destroy(params[:id])
    redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :image, :preparation, :user_id)
  end

end
