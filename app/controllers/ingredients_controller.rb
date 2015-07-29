class IngredientsController < ApplicationController

before_action :select_ingredient, only: [:show, :edit, :destroy]

def select_ingredient
  @ingredient = Ingredient.find(params[:id])
end

def index
  @ingredients = Ingredient.order(:name)
end

def index_by_id
  @ingredients = Ingredient.where(params[:user_id])
end

def show
  @recipes = @ingredient.recipes
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
  params.require(:ingredient).permit(:name, :image, :ingredient_id, :user_id)
end

end
