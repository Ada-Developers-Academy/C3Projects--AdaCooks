class RecipesController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy] # TODO: test that these views require login
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :add_recipe]
  before_action :authenticate_user, only: [:edit, :update, :destroy] # TODO: test this!

  def index
    if params[:search]
      @recipes = Recipe.search_by_ingredient(params[:search]).by_name
    else
      @recipes = Recipe.by_name
    end
  end

  def show
    @steps = @recipe.steps.by_number
    @cookbooks = Cookbook.where(user_id: session[:user_id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(create_params)
    @recipe.user_id = session[:user_id]

    if @recipe.save
      flash[:message] = { success: "Created successfully!" } # TODO: standardize flash messages / displays
      redirect_to recipe_path(@recipe)
    else
      flash.now[:error] = @recipe.errors # TODO: standardize flash messages / displays
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(create_params)
      flash[:message] = { success: "Updated successfully!" }
      redirect_to recipe_path(@recipe)
    else
      flash.now[:error] = @recipe.errors
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to user_path(session[:username])
  end

  def add_recipe
    cookbook = Cookbook.find(params[:cookbook][:cookbook_id])
    cookbook.recipes << @recipe
    cookbook.save

    flash[:message] = { success: "Added to cookbook!" }
    redirect_to recipe_path(@recipe)
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def create_params
      params.require(:recipe).permit(:name, :description, :image)
    end

    def authenticate_user
      redirect_to root_path unless @recipe.owner?(session[:user_id])
    end
end
