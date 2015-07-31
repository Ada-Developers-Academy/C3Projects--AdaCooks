class RecipesController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @recipes = Recipe.alpha_order
  end

  def show
    @recipe = Recipe.find(params[:id])
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def new
    @recipe = Recipe.new
    @user = User.find(session[:user_id])
  end

  def create
    @recipe = Recipe.create(create_params)
    @user = User.find(session[:user_id])
    @recipe.user_id = @user.id

    if @recipe.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(create_params)

    redirect_to recipe_path(recipe)
  end

  def remove_recipes
    recipe = Recipe.find(params[:id])
    cookbook = Cookbook.find(recipe.cookbook_id)
    recipe.cookbook_id = nil
    recipe.save

    redirect_to cookbook_path(cookbook)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    user = User.find(session[:user_id])
    recipe.unassociate_ingredients
    recipe.destroy

    redirect_to user_path(user)
  end

  private

  def create_params
    params.require(:recipe).permit(:name, :description, :image, :preparation,
      :cookbook_id, {:ingredient_ids => [] } )
  end
end
