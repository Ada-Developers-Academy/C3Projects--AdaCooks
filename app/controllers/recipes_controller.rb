class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new

    @ingredients = Ingredient.all.order(:name)

    user = User.find(session[:user_id])

    @cookbooks = user.cookbooks
  end

  def create
    @recipe = Recipe.create(recipe_params)

    if params[:recipe][:cookbook_ids].present?
      @recipe.cookbooks << Cookbook.find(params[:recipe][:cookbook_ids])
    end

    recipe_save_guard(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])

    @user = User.find(@recipe.user_id)

    local_user = User.find(session[:user_id])

    @user_cookbooks = local_user.cookbooks

    @ingredients = @recipe.ingredients
  end

  def edit
    @recipe = Recipe.find(params[:id])

    @ingredients = Ingredient.all.order(:name)

    user = User.find(session[:user_id])

    @cookbooks = user.cookbooks
  end

  def update
    recipe = Recipe.find(params[:id])

    recipe.update(recipe_params)

    if params[:recipe][:cookbook_ids].present?
      recipe.cookbooks << Cookbook.find(params[:recipe][:cookbook_ids])
    end

    recipe_save_guard(recipe)
  end

  def destroy
    recipe = Recipe.find(params[:id])

    recipe.destroy

    redirect_to :back
  end

  def recipe_save_guard(recipe)
    if recipe.save
      redirect_to dashboard_user_path(params[:user_id])
    else
      flash.now[:error] = "Please enter valid stuff"

      redirect_to :back
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name,
      :description,
      :preparation,
      :user_id,
      :image, 
      ingredient_ids: [],
      cookbook_ids: [])
  end
end
