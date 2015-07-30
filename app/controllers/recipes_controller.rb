class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :require_user_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @recipes = Recipe.alphabetized
  end

  def show; end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(create_params)

    if @recipe.save
      flash[:success] = "Your recipe has been created! CHECK IT OUTTTTTtttttt now, baby, check it out now."
      redirect_to recipe_path(@recipe)
    else
      flash[:error] = @recipe.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
    if @recipe.update(edit_params)
      flash[:success] = "Your recipe has been updated! CHECK IT OUTTTTTtttttt now, baby, check it out now."
      redirect_to recipe_path(@recipe)
    else
      flash[:error] = @recipe.errors.full_messages
      render :edit
    end
  end

  def destroy
    name = @recipe.proper_name
    @recipe.destroy
    flash[:success] = "Your recipe has been destroyed. Goodbye, #{ name }!"
    redirect_to recipes_path
  end

  private
    def create_params
      recipe = edit_params
      recipe[:user_id] = session[:user_id]
      return recipe
    end

    def edit_params
      recipe = params.require(:recipe).permit(:name, :steps, :avatar, :description)
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
end
