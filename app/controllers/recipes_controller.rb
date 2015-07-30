class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show, :destroy]

  after_action :last_page

  MESSAGES = {
    create_success: "You have successfully created a new recipe.",
    create_fail: "There was a problem with your new recipe. Please try again.",
    update_success: "You have successfully updated your recipe.",
    update_fail: "There was a problem with your update. Please try again.",
    destroy_success: "You have successfully deleted the recipe.",
    destroy_fail: "There was a problem with your recipe deletion. Please try again."
  }

  def index
    # @recipes = Recipe.alpha
    if params[:search]
      @recipes = Recipe.search(params[:search])
    else
      @recipes = Recipe.alpha
    end
  end

  def show
    @ingredient_lines = @recipe.recipe_ingredients
  end

  def new
    @recipe = Recipe.new
    # @recipe_ingredients = @recipe.recipe_ingredients.build
    # @recipe_id = Recipe.last.id + 1
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      flash[:success] = MESSAGES[:create_success]
      redirect_to recipe_path(@recipe)
    else
      flash[:errors] = MESSAGES[:create_fail]
      render :new
    end
  end

  def edit
    @recipe_name = @recipe.name.titlecase
  end

  def update
    @recipe.update(recipe_params)

    if @recipe.save
      flash[:success] = MESSAGES[:update_success]
      redirect_to @recipe
    else
      flash[:errors] = MESSAGES[:update_fail]
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.destroy(params[:id])
    flash[:success] = MESSAGES[:destroy_success]
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
