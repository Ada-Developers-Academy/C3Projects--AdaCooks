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
    @recipe = Recipe.create(recipe_params)
    @recipe.user_id = session[:user_id]

    if @recipe.save
      @ingredient_recipe = (params[:recipe][:ingredient_ids].first).to_i
      @recipe.ingredients << Ingredient.find(@ingredient_recipe) unless @ingredient_recipe != 0
      # This prevents anything from being saved if the user didn't input any ingredients for a recipe
      redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end

  def update
    remove_recipe_from_cookbook
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

  end

  private

  def remove_recipe_from_cookbook
     cookbook = Cookbook.find(session[:cookbook_id])
     recipe = Recipe.find(params[:recipe_id])

     if cookbook
        recipe.cookbooks.delete(cookbook)
        redirect_to root_path
     end


  end

  def recipe_params
    params.require(:recipe).permit(:user_id, :recipe_id, :name, :description, :image, :ingredients, :preparation, {:ingredient_ids => [] }, {:cookbook_ids => [] })
  end
end
