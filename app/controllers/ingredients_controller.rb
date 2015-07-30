class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:create]

  after_action :last_page

  MESSAGES = {
    create_success: "You have successfully created a new ingredient.",
    create_fail: "There was a problem with your new ingredient. Please try again.",
    update_success: "You have successfully updated your ingredient.",
    update_fail: "There was a problem with your update. Please try again.",
    destroy_success: "You have successfully deleted the ingredient.",
    destroy_fail: "There was a problem with your ingredient deletion. Please try again."
  }

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user = @current_user

    if @ingredient.save
      flash[:success] = MESSAGES[:create_success]
      redirect_to session[:last_page]
    else
      flash[:errors] = MESSAGES[:create_fail]
      render :new
    end
  end

  def update
    @ingredient.update(ingredient_params)
    if @ingredient.save
      flash[:success] = MESSAGES[:update_success]
      redirect_to session[:last_page]
    else
      flash[:errors] = MESSAGES[:update_fail]
      render :edit
    end
  end

  def destroy
    ingredient_id = @ingredient.id
    @ingredient.destroy
    if Ingredient.find_by(id: ingredient_id)
      flash[:errors] = MESSAGES[:destroy_fail]
      redirect_to :back
    else
      flash[:success] = MESSAGES[:destroy_success]
      redirect_to my_ingredients_path
    end
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :image)
  end
end
