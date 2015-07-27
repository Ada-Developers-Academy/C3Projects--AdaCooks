class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient_id = params[:id]
    @ingredient = Ingredient.find(@ingredient_id)
  end

  def new
    @ingredient = Ingredient.new(ingredient_params[:ingredient])
  end

  def create
    @ingredient = Ingredient.create(ingredient_params[:ingredient])
    if @ingredient.save
      redirect_to ingredient_path(@ingredient.id)
    else
      flash[:error] = "Invalid Entry. Ingredient name is required and must be unique"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def ingredient_params
    params.permit(ingredient: [:name, :image])
  end
end
