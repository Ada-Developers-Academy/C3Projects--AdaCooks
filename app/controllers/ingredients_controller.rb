class IngredientsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.alpha_order
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def search
    @ingredients = Ingredient.search(params[:search])
    search_result = Ingredient.where(name: params[:search])
    if !search_result.any?
      flash[:error] = "Unfortunately we don't have #{params[:search].to_s}"
      redirect_to root_path
    else
      render :search
    end
  end

  def new
    @ingredient = Ingredient.new
    @user = User.find(session[:user_id])
  end

  def create
    @ingredient = Ingredient.create(create_params)
    @user = User.find(session[:user_id])

    if @ingredient.save
      redirect_to ingredients_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def create_params
      params.require(:ingredient).permit(:name, :image)
    end
end
