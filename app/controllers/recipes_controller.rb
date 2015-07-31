class RecipesController < ApplicationController

  def index
    if params[:search]
      @recipes = Recipe.search(params[:search]).order("name ASC")
    else
      @recipes = Recipe.all.order('name ASC')
    end
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
      flash[:error] = "A recipe must include 1 or more ingredients. Accepted image formats include: jpg, png and gif. Please try again."
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
    recipe.cookbooks.destroy_all

    input_cookbooks = params[:recipe][:cookbooks]

    input_cookbooks.each do |input|
      if input != ""
        recipe.cookbooks << Cookbook.find(input)
      end
    end
  end

  def edit
    if session[:user_id] == Recipe.find(params[:id]).user_id
      @recipe = Recipe.find(params[:id])

      @ingredients = Ingredient.all.order(:name)
      @cookbooks = Cookbook.where(:user_id => @recipe.user_id).order(:name)
    else
      flash[:error] = "Sorry, you do not have administrative rights to this recipe."

      redirect_to root_path
    end
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
    params.require(:recipe).permit(:name, :description, :preparation, :image, :user_id, :ingredients, :cookbooks)
  end

end
