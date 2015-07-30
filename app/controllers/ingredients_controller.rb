class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :require_user_login, only: [:edit, :update, :destroy]

  def index
    @ingredients = Ingredient.alphabetized
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(create_params)
    redirect_to ingredient_path(@ingredient)
  end

  def edit; end
  def update; end
  def show; end
  def destroy; end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def create_params
      # make sure you include the :avatar!
      ing = params.require(:ingredient).permit(:name, :avatar)
      ing[:user_id] = 1
      return ing
    end
end
