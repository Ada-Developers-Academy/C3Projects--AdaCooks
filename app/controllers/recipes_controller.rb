class RecipesController < ApplicationController
  before_action :find_recipe, only: [ :show, :edit, :update, :destroy ]
  before_action :get_recipe_associations, only: [ :new, :create, :edit, :update ]
  before_action :require_login, only: [ :new, :create, :edit, :update, :destroy ]

  def index
    @recipes = Recipe.all.alpha_order
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(create_recipe_params)
    @recipe.user_id = session[:user_id]

    if @recipe.save
      redirect_to recipe_path(@recipe.id), notice: "Recipe added!"
    else
      flash.now[:errors] = ERRORS[:unsuccessful_save]
      render :new
    end
  end

  def edit; end

  def update
    @recipe.update(create_recipe_params)
    @recipe.ingredient_ids = [] unless params[:recipe][:ingredient_ids]
    @recipe.cookbook_ids = [] unless params[:recipe][:cookbook_ids]

    if @recipe.save
      redirect_to recipe_path(@recipe.id), notice: "Recipe updated!"
    else
      flash.now[:errors] = ERRORS[:unsuccessful_save]
      render :new
    end
  end

  def destroy
    @recipe.destroy

    redirect_to user_path(session[:user_id]), notice: "Recipe deleted."
  end

  private

  def create_recipe_params    # note: access to associated objects (e.g., cookbooks) will be through that controller.
    params.require(:recipe).permit(
      :name,
      :description,
      :preparation,
      :image,
      ingredient_ids: [],
      cookbook_ids: []
    )
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def get_recipe_associations
    @ingredients = Ingredient.all
    @cookbooks = Cookbook.where(user_id: session[:user_id])
  end
end
