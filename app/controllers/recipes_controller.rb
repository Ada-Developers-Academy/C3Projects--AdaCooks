class RecipesController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @recipes = Recipe.alpha_order
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @user = User.find(session[:user_id])
  end

  def create
    @recipe = Recipe.create(create_params)
    @user = User.find(session[:user_id])

    if @recipe.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    recipe = Recipe.find(params[:id])
    cookbook = recipe.cookbook_id
    recipe.destroy


    redirect_to cookbook_path(cookbook)
  end

  private

  def create_params
    params.require(:recipe).permit(:name, :description, :image, :preparation,
      :cookbook_id, {:ingredient_ids => [] } )
  end
end
