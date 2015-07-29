class RecipesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.search(params[:search])
  end

  def show
    @user = @recipe.user
    @ingredients = @recipe.ingredients
  end

  def new
    @recipe = Recipe.new
  end

  def create
    if @recipe.save
      redirect_to recipes_path, notice: "Recipe successfully added chef!"
    else
      flash.now[:error] = "Error!!"
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @recipe.save
      redirect_to recipes_path, notice: "It's so fancy now"
    else
      flash.now[:error] = "Throw yo hands in the ERROR!!"
      render :new
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "#{@recipe} is no more :("
  end

  def search
    @recipes = Recipe.search params[:search]
    render :search_results
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :desc, :prep, :image, :cookbook_id, :user_id)
  end
end
