class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :require_user_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.alphabetized
  end

  def show; end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(create_params)

    if @ingredient.save
      flash[:success] = "Your ingredient has been created! CHECK IT OUTTTTTtttttt now, baby, check it out now."
      redirect_to ingredient_path(@ingredient)
    else
      flash[:error] = @ingredient.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
    if @ingredient.update(edit_params)
      flash[:success] = "Your ingredient has been updated! CHECK IT OUTTTTTtttttt now, baby, check it out now."
      redirect_to ingredient_path(@ingredient)
    else
      flash[:error] = @ingredient.errors.full_messages
      render :edit
    end
  end

  def destroy
    name = @ingredient.proper_name
    @ingredient.destroy
    flash[:success] = "Your ingredient has been destroyed. Goodbye, #{ name }!"
    redirect_to ingredients_path
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def create_params
      ingredient = edit_params
      ingredient[:user_id] = session[:user_id]
      return ingredient
    end

    def edit_params
      ingredient = params.require(:ingredient).permit(:name, :avatar)
      ingredient[:name].downcase!
      return ingredient
    end
end
