class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredients_params)

    ingredient_save_guard(@ingredient)
  end

  def show
    @ingredient = Ingredient.find(params[:id])

    @recipes = @ingredient.recipes
  end

  def ingredient_save_guard(ingredient)
    if ingredient.save
      redirect_to dashboard_user_path(params[:user_id])
    else
      flash.now[:error] = "Please enter valid stuff"

      redirect_to :back
    end
  end

  private

  def ingredients_params
    params.require(:ingredient).permit(:name, :user_id, { :recipe_ids => [] })
  end
end
