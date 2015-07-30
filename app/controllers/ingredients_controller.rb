class IngredientsController < ApplicationController

before_action :select_ingredient, only: [:show, :edit, :destroy, :update ]

def select_ingredient
  @ingredient = Ingredient.find(params[:id])
end

def index
  @ingredients = Ingredient.order(:name)
  session[:recipe_id] = nil
end

def index_by_id
  @ingredients = Ingredient.where(params[:user_id])
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
  unless Ingredient.search(params[:ingredient][:name])
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
  else
    @ingredient = Ingredient.where(name: params[:ingredient][:name])
    recipe = Recipe.find(session[:recipe_id])
    recipe.ingredients << @ingredient
    redirect_to new_user_ingredient_path(session[:user_id])
  end
end

def edit
  redirect_to new_user_ingredient_path(session[:user_id])
end

def update
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

#-----------------------------------------------------------------------------

# def got_ingredient
#   input = gets.chomp.upcase

#   if input == ingredient.name
#     #gives user that information instead of creating a new ingredient page
#   else
#     #routes user to ingredient#create
#   end 
# end

# def ArticlesController < ApplicationController
#   def index
#     if params[:search]
#       @articles = Article.search(params[:search]).order("created_at DESC")
#     else
#       @articles = Article.order("created_at DESC")
#     end
#   end
# end
