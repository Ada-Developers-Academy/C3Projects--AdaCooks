class IngredientsController < ApplicationController
  before_action :require_login, except: [:index]
  before_action :find_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all.alphabetical
  end

  def show
    @recipes = @ingredient.recipes
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    if @ingredient.save
      redirect_to ingredients_path, notice: "Ingredient successfully added!"
    else
      flash.now[:error] = "Error!!"
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else
      flash.now[:error] = "Invalid edit"
      render :new
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_path
  end

private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :image)
  end

end
