class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @ingredients = Ingredient.alpha_order
  end

  def show; end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render 'new'
    end
  end

  private

      def create_ingredient
        @ingredient = Ingredient.new
      end

      def set_ingredient
        @ingredient = Ingredient.find(params[:id])
      end

      def ingredient_params
        params.require(:ingredient).permit(:name, :image, :user_id)
      end
end
