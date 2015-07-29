class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all.order('name ASC')
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = Ingredient.find(params[:id]).recipes
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
    @ingredient.destroy
    redirect_to user_dashboard_path(session[:user_id])
  end

end

###########################################################
  private

  def create_params
    params.permit(ingredient: [:name, :image ,:user_id, :recipe_id])
  end
