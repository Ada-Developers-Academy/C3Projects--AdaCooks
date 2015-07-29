class RecipesController < ApplicationController
  def index
    @recipes = Recipe.alpha_order
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
