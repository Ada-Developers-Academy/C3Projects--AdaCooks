class RecipesController < ApplicationController

  def index
    @recipes = Recipe.order(:name)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
    @cookbooks = Cookbook.where(user_id: session[:user_id])
  end

  def create
    @recipe = Recipe.new(create_recipe_params)
    @recipe.user_id = session[:user_id]

    if @recipe.save
      redirect_to root_path, notice: "Recipe added!"
    else
      flash.now[:error] = ERRORS[:unsuccessful_save]
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
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


end
