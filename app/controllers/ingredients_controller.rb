class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.order(:name)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = @ingredient.recipes
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredeitn.new(create_ingredient_params)
    @ingredient.user_id = session[:user_id]

    if @ingredient.save
      redirect_to ingredient_path(@ingredient.id), notice: "Ingredient added!"
    else
      flash.now[:errors] = ERRORS[:unsuccessful_save]
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

  def create_ingredient_params    # note: access to associated objects (e.g., cookbooks) will be through that controller.
    params.require(:ingredient).permit(
      :name,
      :image,
      recipe_ids: [],
    )
  end

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
