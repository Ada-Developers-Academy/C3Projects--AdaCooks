class IngredientsController < ApplicationController
  before_action :require_login, except: [:index, :show, :search]
  before_action :find_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.alpha
  end

  def show
    @user = current_user
    @recipes = @ingredient.recipes
  end

  def new
    @ingredient = Ingredient.new
    @url = ingredients_path
    @method = :post
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save && (params[:ingredient][:request] == "http://localhost:3000/ingredient_check")
      redirect_to ingredient_index_path
    elsif @ingredient.save && (params[:ingredient][:request] != "http://localhost:3000/ingredient_check")
      redirect_to ingredients_path, notice: "Ingredient successfully added!"
    else
      flash.now[:error] = "Ingredient must have a name and must be unique"
      render :new
    end
  end

  def edit
    @url = ingredient_path
    @method = :patch
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

  def search
    flash[:error] = "Aw, we couldn't find any ingredients with '#{params[:search]}'."
    @ingredients = Ingredient.search params[:search]
    render :search_results
  end

  def ingredient_check
    @ingredients = Ingredient.all.sort_by { |i| i.name.upcase }
  end

private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :image)
  end

end
