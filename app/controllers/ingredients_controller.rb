class IngredientsController < ApplicationController

  def index
    if params[:search]
      @ingredients = Ingredient.search(params[:search]).order("created_at ASC")
      @recipes = @ingredients.map do |ingredient|
        ingredient.recipes
      end.flatten

    else
      @ingredients = Ingredient.all.order('name ASC')
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = Recipe.where(ingredient_id: @ingredient.id)
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(create_params[:ingredient])
    @ingredient.user_id = session[:user_id]

    @ingredient.save
    redirect_to user_dashboard_path(session[:user_id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(create_params[:ingredient])
    redirect_to user_dashboard_path(session[:user_id])
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])

    single_ingredient_recipes = []

    @ingredient.recipes.each do |recipe|
      if recipe.ingredients.count == 1
        single_ingredient_recipes.push(recipe)
      end
    end

    if single_ingredient_recipes.length == 0
      @ingredient.destroy
    else
      flash[:error] = "Sorry, this ingredient is the last ingredient in an existing recipe. It cannot be deleted."
    end

    redirect_to user_dashboard_path(session[:user_id])
  end

end

###########################################################
  private

  def create_params
    params.permit(ingredient: [:name, :image ,:user_id, :recipe_id])
  end
