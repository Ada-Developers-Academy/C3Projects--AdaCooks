class IngredientsController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :check_user_params, except: [:show]

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.create(ingredients_params)

    ingredient_save_guard(ingredient)
  end

  def index
    user = User.find(session[:user_id])

    @ingredients = user.ingredients.order(:name)
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    ingredient = Ingredient.find(params[:id])

    ingredient.update(ingredients_params)

    ingredient_save_guard(ingredient)
  end

  def show
    @ingredient = Ingredient.find(params[:id])

    @recipes = @ingredient.recipes
  end

  def destroy
    ingredient = Ingredient.find(params[:id])

    ingredient.destroy

    redirect_to user_ingredients_path(session[:user_id])
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
    params.require(:ingredient).permit(:name, :user_id, :image, { :recipe_ids => [] })
  end
end
