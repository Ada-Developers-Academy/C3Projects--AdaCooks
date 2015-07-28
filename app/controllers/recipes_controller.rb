class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order(:name)
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
    @recipe = Recipe.find(params[:id])
  end

  def destroy
  end
end
