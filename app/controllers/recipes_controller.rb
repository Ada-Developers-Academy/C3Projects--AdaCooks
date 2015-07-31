class RecipesController < ApplicationController
  before_action :current_user, only: [:show, :add_to_cookbook, :edit, :update, :new]

  before_action :set_recipe, except: [:index, :new, :create]
  before_action :setup_show, only: [:show, :add_to_cookbook]
  
  after_action :last_page

  MESSAGES = {
    create_success: "You have successfully created a new recipe.",
    create_fail: "There was a problem with your new recipe. Please try again.",
    update_success: "You have successfully updated your recipe.",
    update_fail: "There was a problem with your update. Please try again.",
    destroy_success: "You have successfully deleted the recipe.",
    destroy_fail: "There was a problem with your recipe deletion. Please try again.",
    cookbook_fail: "Saving this recipe to that cookbook did not work. Please try again. ",
    not_yo_recipe: "You cannot edit someone else's recipe."
  }

  def index
    if params[:search]
      @recipes = Ingredient.search(params[:search])
      if @recipes == nil
        flash[:errors] = "Sorry, we can't find that ingredient! So here are ALL the recipes!"
        @recipes = Recipe.alpha
      end
    else
      @recipes = Recipe.alpha
    end
  end

  def new
    @recipe = Recipe.new
    @cookbooks = @current_user.cookbooks - @recipe.cookbooks if @current_user
    5.times { @recipe.recipe_ingredients.build }
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
    if @recipe.user != @current_user
      flash[:errors] = MESSAGES[:not_yo_recipe]
      redirect_to @recipe
    end
    5.times { @recipe.recipe_ingredients.build }
    @recipe_name = @recipe.name.titlecase
  end

  def update
    @recipe.clear_ingredients
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
    cookbook_id = params[:cookbook][:cookbook_id]
    cookbook = Cookbook.find(cookbook_id)
    @recipe.cookbooks << cookbook

    if @recipe.cookbooks.exists?(id: cookbook_id)
      flash[:success] = "You successfully saved this recipe to your cookbook '#{cookbook.name}'."
      redirect_to @recipe
    else
      flash[:errors] = MESSAGES[:cookbook_fail]
      render :show
    end
  end

  private

  def setup_show
    @owner = @recipe.user
    @ingredient_lines = @recipe.recipe_ingredients
    @cookbooks = @current_user.cookbooks - @recipe.cookbooks if @current_user
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(
    :name, :description, :image, :preparation, :user_id, :cookbook_ids,
    recipe_ingredients_attributes: [
      :quantity, :measurement_id, :ingredient_id, :_destroy
      ]
    )
  end
end
