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
  user = User.find(session[:user_id])
  @ingredients = user.ingredients
end

def create
  recipe = Recipe.find(session[:user_id])
  user = User.find(session[:user_id])
  @ingredient = recipe.ingredients.create(ingredient_params)
  @ingredient.user_id = user.id
  if @ingredient.save
    redirect_to new_user_ingredient_path(session[:user_id])
  else
    flash[:error] = "It did not save"
    render :new
  end
end

def edit
end

def update
  @ingredient.update(ingredient_params)

  redirect_to
end

def destroy
  @ingredient.destroy
  redirect_to new_user_ingredient_path(session[:user_id])
end

private
#params ------------------------------------------------------------------------------

def ingredient_params
  params.require(:ingredient).permit(:name, :image, :ingredient_id, :user_id)
end

end
