class IngredientsController < ApplicationController
  before_action :login_required, except: [:index, :search, :show]
  before_action :belongs_to_user, only: [:edit, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient_id = params[:id]
    @ingredient = Ingredient.find(@ingredient_id)
    @recipes = @ingredient.recipes
  end

  def new
    @ingredient = Ingredient.new(ingredient_params[:ingredient])
  end

  def create
    @ingredient = Ingredient.create(ingredient_params[:ingredient])
    if @ingredient.save
      redirect_to ingredient_path(@ingredient.id)
    else
      flash[:errors] = error_messages(@ingredient)
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
    if @ingredient.save
      redirect_to ingredients_path(@ingredient_id)
    elsif
      flash[:errors] = error_messages(@ingredient)
      redirect_to edit_ingredient_path(@ingredient_id)
    end
  end

  def destroy
    @ingredient_id = params[:id]
    @ingredient = Ingredient.find(@ingredient_id)
    @ingredient.destroy

    redirect_to ingredients_path
  end

	def search
    @ingredients = Ingredient.search params[:search]
    @recipes = []
    @ingredients.each do |ingredient|
      array = ingredient.recipes
      @recipes.concat array
    end
    @recipes = @recipes.uniq
    if @recipes.empty?
      flash.now[:error] = "Search returned no results."
    end
    render :search_results
  end

  private

  def ingredient_params
    params.permit(ingredient: [:name, :image, :user_id])
  end

  def belongs_to_user
  @ingredient = Ingredient.find(params[:id])
    if @ingredient.user_id != session[:user_id]
      redirect_to ingredients_path
    end
  end
end
