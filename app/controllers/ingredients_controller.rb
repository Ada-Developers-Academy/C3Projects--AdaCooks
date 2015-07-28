class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient_id = params[:id]
    @ingredient = Ingredient.find(@ingredient_id)
    @recipes = @ingredient.recipe
  end

  def new
    @ingredient = Ingredient.new(ingredient_params[:ingredient])
  end

  def create
    @ingredient = Ingredient.create(ingredient_params[:ingredient])
    if @ingredient.save
      redirect_to ingredient_path(@ingredient.id)
    else
      flash[:error] 
      redirect_to new_ingredient_path
    end
  end

  def edit
    @ingredient_id = params[:id]
    @ingredient = Ingredient.find(@ingredient_id)
  end

  def update
    @ingredient_id = params[:id]
    @ingredient = Ingredient.find(@ingredient_id)
    @ingredient.update(ingredient_params[:ingredient])

    redirect_to ingredient_path(@ingredient_id)
  end

  def destroy
    @ingredient_id = params[:id]
    @ingredient = Ingredient.find(@ingredient_id)
    @ingredient.destroy

    redirect_to ingredients_path
  end

  private

  def ingredient_params
    params.permit(ingredient: [:name, :image, :user_id])
  end
end
