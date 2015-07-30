class RecipesController < ApplicationController
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
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = User.find(@recipe.user_id).username.capitalize
  end

  def create
    @recipe = Recipe.create(recipe_params)
    # @recipe.user_id = session[:user_id]
    @unicorns = (params[:recipe][:ingredient_ids].first).to_i
    @recipe.ingredients << Ingredient.find(@unicorns)
    # @join = IngredientsRecipes.create(recipe_id, ingredient_id)



    if @recipe.save
        redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :image, :ingredients)
  end
end
