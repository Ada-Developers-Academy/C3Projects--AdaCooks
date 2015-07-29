class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.order('name ASC')
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new

    @cookbooks = Cookbook.where(:user_id => params[:user_id])
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
  
    else
      flash[:error] = "Please enter valid values"

    end
      
      redirect_to user_dashboard_path(session[:user_id])

  end

###########################################################
  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation, :image, :categories, :user_id)
  end

end
