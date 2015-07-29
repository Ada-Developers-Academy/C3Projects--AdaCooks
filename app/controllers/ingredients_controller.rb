class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.alpha_order
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def search
    @ingredients = Ingredient.search(params[:search])
    search_result = Ingredient.where(name: params[:search])
    if !search_result.any?
      flash[:error] = "Unfortunately we don't have #{params[:search].to_s}"
      redirect_to root_path
    else
      render :search
    end
  end

  def new
    @ingredient = Ingredient.new
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
