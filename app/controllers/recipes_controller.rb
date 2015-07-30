class RecipesController < ApplicationController
  before_action :user_logged_in, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_recipe, only: [:edit, :update]

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

  def edit
  end

  def update
    if @recipe.update(valid_recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    user = User.find(session[:user_id])
    user_recipes = Recipe.where(user_id: user.id)

    redirect_to recipes_path(user_recipes)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def valid_recipe_params
    params.require(:recipe).permit(:name, :preparation, :user_id)
  end

  def user_logged_in
    recipe = Recipe.find(params[:id])
    if session[:user_id].nil?
      redirect_to recipe_path(id: recipe.id), flash: { errors: ERRORS[:unauth_user_error] }
    end
  end

  def correct_user
    recipe = Recipe.find(params[:id])
    user_assoc_with_recipe = User.find(recipe.user_id)
    logged_in_user = User.find(session[:user_id])

    unless user_assoc_with_recipe == logged_in_user
      redirect_to user_path(id: logged_in_user.id), flash: { errors: ERRORS[:unauth_user_error] }
    end

  end
end
