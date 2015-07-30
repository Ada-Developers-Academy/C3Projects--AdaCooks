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
      redirect_to :back
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
    @ingredient.user_id = @user.id

    if @ingredient.save
      redirect_to new_recipe_path
    else
      render 'new'
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    user = User.find(session[:user_id])
    ingredient = Ingredient.find(params[:id])
    ingredient.update(create_params)
    redirect_to ingredients_path
  end

  def destroy
  end

  private

    def create_params
      params.require(:ingredient).permit(:name, :image, :photo_url)
    end
end
