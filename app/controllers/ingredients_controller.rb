class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :destroy]
  before_action :require_login, only: [:new]

  def index
    @ingredients = Ingredient.all.alphabet
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    if session[:user_id] != @ingredient.user_id
      redirect_to ingredient_path(@ingredient)
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)

    if @ingredient.save
      redirect_to user_path(session[:user_id])
    else
      render :edit
    end
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

    redirect_to user_path(session[:user_id])
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
