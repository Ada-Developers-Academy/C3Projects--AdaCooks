class CookbooksController < ApplicationController
  def index
    @cookbooks = User.find(params[:user_id]).cookbooks
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    @cookbook = Cookbook.find(params[:id])
    @recipes = @cookbook.recipes
  end

  def destroy
  end
end
