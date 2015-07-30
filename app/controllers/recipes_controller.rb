class RecipesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all.sort_by {|recipe| recipe.name}
  end

  def show
    @user = @recipe.user
    @ingredients = @recipe.ingredients
  end

  def new
    @recipe = Recipe.new
    @url = recipes_path
    @method = :post
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @ingredient_ids = params[:recipe][:ingredient_ids]

    Ingredient.save_to_recipe

    if @recipe.save
      raise
      redirect_to recipes_path, notice: "Recipe successfully added chef!"
    else
      flash.now[:error] = "Error!!"
      render :new
    end
  end

  def edit
    @url = recipe_path(@recipe)
    @method = :patch
  end

  def update
    if @recipe.save
      redirect_to recipes_path, notice: "You so fancy!"
    else
      flash.now[:error] = "Throw yo hands in the ERROR!!"
      render :new
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "#{@recipe} is no more :("
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :desc, :prep, :image, :cookbook_id, :user_id, :ingredient_ids, ingredients_attributes: [:name])
  end

  # def ingredient_params
    # params.require(recipe: :ingredient).permit(:name, :image)
  # end
end
