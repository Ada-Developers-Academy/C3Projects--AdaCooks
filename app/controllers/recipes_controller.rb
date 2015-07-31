class RecipesController < ApplicationController
  before_action :require_login, only: [:new]
  # before_action :user_cookbooks, only: [:new]

  def index
    if params[:search]
      @recipes = Recipe.search(params[:search])
      render :results
    else
      @recipes = Recipe.all.alphabet
      render :index
    end
  end

  def new
    @user = User.find(session[:user_id])
    @recipe = Recipe.new(user_id: @user.id)
    @ingredients = Ingredient.all
    @cookbook = Cookbook.where(user_id: @user.id )
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = User.find(@recipe.user_id).username.capitalize
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = session[:user_id]
    @recipe.validate

    if @recipe.valid?
      @ingredient_recipe = (params[:recipe][:ingredient_ids].first).to_i
      @recipe.ingredients << Ingredient.find(@ingredient_recipe) unless @ingredient_recipe != 0
      # This prevents anything from being saved if the user didn't input any ingredients for a recipe
      @recipe.save
      redirect_to user_path(session[:user_id])
    else
      @cookbook = Cookbook.where(user_id: session[:user_id])
      @user = User.find(session[:user_id])
      @ingredients = Ingredient.all
      @recipe = Recipe.new(user_id: @user.id)
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_path(session[:user_id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :name, :description, :image, :ingredients, :preparation, {:ingredient_ids => [] }, {:cookbook_ids => [] })
  end
end
