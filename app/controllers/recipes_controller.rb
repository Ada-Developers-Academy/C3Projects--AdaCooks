class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show, :destroy, :add_to_cookbook]
  before_action :current_user, only: [:show, :add_to_cookbook]

  after_action :last_page

  MESSAGES = {
    create_success: "You have successfully created a new recipe.",
    create_fail: "There was a problem with your new recipe. Please try again.",
    update_success: "You have successfully updated your recipe.",
    update_fail: "There was a problem with your update. Please try again.",
    destroy_success: "You have successfully deleted the recipe.",
    destroy_fail: "There was a problem with your recipe deletion. Please try again.",
    cookbook_success: "You saved this recipe to your cookbook.",
    cookbook_fail: "Saving this recipe to that cookbook did not work. Please try again. "
  }

  def index
    @recipes = Recipe.alpha
  end

  def show
    @ingredient_lines = @recipe.recipe_ingredients
    @owner = @recipe.user
    @cookbooks = @current_user.cookbooks
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

  def add_to_cookbook
    @owner = @recipe.user
    @ingredient_lines = @recipe.recipe_ingredients
    @cookbooks = @current_user.cookbooks

    cookbook_id = params[:cookbook][:cookbook_id]
    cookbook = Cookbook.find(cookbook_id)
    @recipe.cookbooks << cookbook

    # raise
    if @recipe.cookbooks.exists?(id: cookbook_id)
      flash[:success] = MESSAGES[:cookbook_success]
      redirect_to @recipe
    else
      flash[:errors] = MESSAGES[:cookbook_fail]
      render :show
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :image, :preparation, :user_id)
  end
end
