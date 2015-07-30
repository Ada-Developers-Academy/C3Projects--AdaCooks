class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [ :show, :edit, :update, :destroy ]
  before_action :require_login, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :get_ingredient_associations, only: [ :new, :create, :edit, :update ]

  def index
    @ingredients = Ingredient.order(:name)
  end

  def show
    @recipes = @ingredient.recipes
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(create_ingredient_params)
    @ingredient.user_id = session[:user_id]

    if @ingredient.save
      redirect_to ingredient_path(@ingredient.id), notice: "Ingredient added!"
    else
      flash.now[:errors] = ERRORS[:unsuccessful_save]
      render :new
    end
  end

  def edit; end

  def update
    @ingredient.update(create_ingredient_params)
    @ingredient.recipe_ids = [] unless params[:ingredient][:recipe_ids]

    if @ingredient.save
      redirect_to ingredient_path(@ingredient.id), notice: "Ingredient updated!"
    else
      flash.now[:errors] = ERRORS[:unsuccessful_save]
      render :new
    end
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

  def get_ingredient_associations
    @recipes = Recipe.where(user_id: session[:user_id])
  end
end
