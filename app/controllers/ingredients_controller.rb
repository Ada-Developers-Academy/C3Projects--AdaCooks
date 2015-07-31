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

  def edit; end

  def update
    @ingredient.update(ingredient_params)

    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

      def set_ingredient
        @ingredient = Ingredient.find(params[:id])
      end

      def ingredient_params
        params.require(:ingredient).permit(:name, :image, :user_id)
      end

      def correct_user
        if session[:user_id].nil?
          redirect_to root_path
        else
          logged_in_user = User.find(session[:user_id])
          redirect_to user_path(logged_in_user) unless @ingredient.user_id == logged_in_user.id
        end
      end
end
