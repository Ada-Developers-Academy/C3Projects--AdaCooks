class IngredientsController < ApplicationController

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = @ingredient.recipes
  end

  private

  def ingredients_params
    params.require(:ingredient).permit(:name, :user_id, { :recipe_ids => [] }
  end
end
