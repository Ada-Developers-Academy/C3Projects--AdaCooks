class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :destroy]
  before_action :require_login, only: [:new]

  def index
    @ingredients = Ingredient.all.alphabet
  end

  def show
    @ingredient = find_ingredient
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user_id = session[:user_id]
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def destroy
    @ingredient.destroy

    redirect_to root_path
  end

  private

    def find_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name, :image)
      # params.require(:product).permit(:name, :price, :desc, :stock, :photo_url, :user_id, :retired, :category_ids => [], :categories_attributes => [:id, :name])

    end

end
