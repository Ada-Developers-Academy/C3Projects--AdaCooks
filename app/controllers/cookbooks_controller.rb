class CookbooksController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    if session[:user_id] == params[:user_id].to_i
      @cookbook = Cookbook.find(params[:id])
      @recipes = @cookbook.recipes
      @recipe_count = @recipes.count
      render :show
    else
      redirect_to root_path
    end
  end

  def edit; end
end
