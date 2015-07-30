class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.order('name ASC')
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    if session[:user_id] == params[:user_id].to_i
      @recipe = Recipe.new

      @ingredients = Ingredient.all.order(:name)
      @cookbooks = Cookbook.where(:user_id => params[:user_id]).order(:name)
    else
      flash[:error] = "You do not have access to this user's products"

      redirect_to user_dashboard_path(session[:user_id])
    end
  end

  def create
    @recipe = Recipe.create(recipe_params)

    if @recipe.save
      associate_ingredients(@recipe)
      associate_cookbooks(@recipe)
    else
      flash[:error] = "Please enter valid values"
    end

    redirect_to user_dashboard_path(session[:user_id])
  end

  def associate_ingredients(recipe)
    recipe.ingredients.destroy_all

    input_ingredients = params[:recipe][:ingredients]

    input_ingredients.each do |input|
      if input != ""
        recipe.ingredients << Ingredient.find(input)
      end
    end
  end

  def associate_cookbooks(recipe)
    cookbook_id = params[:recipe][:cookbooks].to_i

    if cookbook_id != 0
      recipe.cookbooks << Cookbook.find(cookbook_id)
    end

  end

  def edit
    @recipe = Recipe.find(params[:id])

    @ingredients = Ingredient.all.order(:name)
    @cookbooks = Cookbook.where(:user_id => params[:user_id]).order(:name)
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.update(recipe_params)

    associate_ingredients(@recipe)
    associate_cookbooks(@recipe)

    redirect_to user_dashboard_path(session[:user_id])
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to user_dashboard_path(session[:user_id])
  end


###########################################################
  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation, :image, :categories, :user_id)
  end

end
