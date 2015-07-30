class RecipesController < ApplicationController

before_action :select_recipe, only: [:edit, :destroy, :update]

  def select_recipe
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    
  end

  def add_recipe
    cookbook = Cookbook.find(params[:recipe][:cookbook_ids])
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.cookbooks << cookbook
    redirect_to user_cookbooks_path(session[:user_id])
  end

  def new
    @recipe = Recipe.new
    session[:recipe_id] = nil
  end

  def create 
    user = User.find(session[:user_id])
    @recipe = Recipe.create(recipe_params)
    @recipe.user_id = user.id

    if @recipe.save
      session[:recipe_id] = @recipe.id
      redirect_to new_user_ingredient_path(session[:user_id])
    else
      render :new
    end
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)

    redirect_to user_recipe_path(session[:user_id], recipe_id)
  end


def remove
  cookbook = Cookbook.find(params[:cookbook_id])
  recipe = cookbook.recipes.find(params[:recipe_id])
  cookbook.recipes.delete(recipe)
  redirect_to user_cookbook_path(session[:user_id], params[:cookbook_id])
end


private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions, :image, :user_id, :cookbook_ids)
  end


end
