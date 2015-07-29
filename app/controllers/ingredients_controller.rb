class IngredientsController < ApplicationController

before_action :select_ingredient, only: [:show, :edit, :destroy]

def select_ingredient
  @ingredient = Ingredient.find(params[:id])
end

def index
  @ingredients = Ingredient.order(:name)
end

def show
  @recipes = Recipes.where(params[:ingredient_id]) 
end

def new
  @ingredient = Ingredient.new
end

def create
  @ingredient = Ingredient.create(ingredient_params)
  
  redirect_to
end

def edit
end

def update
  @ingredient.update(ingredient_params)

  redirect_to
end

def destroy
  @ingredient.destroy

  redirect_to
end

private
#params ------------------------------------------------------------------------------

def ingredient_params
  params.require(:ingredient).permit(:name, :image, :ingredient_id)
end

end
