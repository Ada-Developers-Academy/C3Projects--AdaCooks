class IngredientsController < ApplicationController

before_action :select_ingredient, only: [:show, :edit, :destroy, :update]

def select_ingredient
  @ingredient = Ingredient.find(params[:id])
end

def index

  @ingredients = Ingredient.order(:name)
  session[:recipe_id] = nil
end

def index_by_user
  @ingredients = Ingredient.where(user_id: session[:user_id])
  session[:recipe_id] = nil
end

def show
  @recipes = @ingredient.recipes
end

def new
  @ingredient = Ingredient.new
  @user = User.find(session[:user_id])
  @recipe = Recipe.find(session[:recipe_id])
  @ingredients = @recipe.ingredients
end

def create
  recipe = Recipe.find(session[:recipe_id])
  user = User.find(session[:user_id])
  @ingredient = Ingredient.new(ingredient_params)
  recipe.ingredients << @ingredient
  @ingredient.user_id = user.id
  if @ingredient.save
    redirect_to new_user_ingredient_path(session[:user_id])
  else
    flash[:error] = "It did not save"
    render :new
  end
end

def edit
  if session[:recipe_id].nil?
    @ingredient = Ingredient.find(params[:id])
  else
    redirect_to new_user_ingredient_path(session[:user_id])
  end
end

def update
  if session[:recipe_id].nil?
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_by_user_path(session[:user_id])
    else
      render :edit
    end
  else
    redirect_to new_user_ingredient_path(session[:user_id])
    # recipe = Recipe.find(session[:recipe_id])
    # user = User.find(session[:user_id])
    # @ingredient = Ingredient.new(ingredient_params)
    # recipe.ingredients << @ingredient
    # @ingredient.user_id = user.id
    # if @ingredient.save
    #   redirect_to new_user_ingredient_path(session[:user_id])
    # else
    #   flash[:error] = "It did not save"
    #   render :new
    # end
  end
end

def remove
  recipe = Recipe.find(session[:recipe_id])
  ingredient = recipe.ingredients.find(params[:ingredient_id])
  recipe.ingredients.delete(ingredient)
  redirect_to new_user_ingredient_path(session[:user_id])
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
