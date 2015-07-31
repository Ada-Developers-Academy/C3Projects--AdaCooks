class IngredientsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy] # TODO: test that these views require login
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy] # TODO: add tests for edit, update, and destroy.
  before_action :authenticate_user, only: [:edit, :update, :destroy] # TODO: test this!

  def index
    @ingredients = Ingredient.by_name
  end

  def show
  end

  def new # TODO: add tests
    @ingredient = Ingredient.new
  end

  def create # TODO: add tests
    @ingredient = Ingredient.new(create_params)
    @ingredient.user_id = session[:user_id]

    if @ingredient.save
      flash[:message] = { success: "Created successfully!" } # TODO: standardize flash messages / displays
      redirect_to ingredient_path(@ingredient)
    else
      flash.now[:error] = @ingredient.errors # TODO: standardize flash messages / displays
      render :new
    end
  end

  def edit # TODO: add tests
  end

  def update # TODO: add tests
    if @ingredient.update(create_params)
      flash[:message] = { success: "Updated successfully!" } # TODO: standardize flash messages / displays
      redirect_to ingredient_path(@ingredient)
    else
      flash.now[:error] = @ingredient.errors # TODO: standardize flash messages / displays
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

    def create_params
      params.require(:ingredient).permit(:name, :image)
    end

    def authenticate_user
      redirect_to root_path unless @ingredient.user_id == session[:user_id] # OPTIMIZE: consider writing a method for this
    end
end
