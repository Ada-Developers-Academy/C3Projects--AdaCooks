class CookbooksController < ApplicationController
  before_action :require_user_login
  before_action :set_cookbook, only: [:edit, :show, :destroy]

  def index
    @cookbooks = @authenticated_user.cookbooks
  end

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.create(create_params)

    if @cookbook.save
      flash[:success] = "Your cookbook has been created."
      redirect_to user_cookbook_path(@authenticated_user, @cookbook.id)
    else
      flash[:error] = @cookbook.errors.full_messages.first
      render :new
    end
  end

  def edit
  end

  def update
    @cookbook = Cookbook.update(params[:id], create_params)

    if @cookbook.save
      flash[:success] = "Your cookbook has been edited."
      redirect_to user_cookbook_path(@authenticated_user, @cookbook.id)
    else
      flash[:error] = @cookbook.errors.full_messages.first
      render :edit
    end
  end

  def show
    @recipes = @cookbook.recipes
  end

  def destroy
    associated_recipes = @cookbook.recipes

    Cookbook.destroy(params[:id])

    # forces recipe entry to reload so that recipe.cookbooks no longer shows
    # association with deleted cookbook (SQL caches the old association)
    associated_recipes.each { |recipe| recipe.reload }

    redirect_to user_cookbooks_path(@authenticated_user)
  end

  def add_recipe
    cookbook = Cookbook.find(params[:cookbook_id])
    recipe = Recipe.find(params[:id])

    if cookbook.recipes.include?(recipe)
      flash[:error] = "This recipe is already in #{cookbook.name}."
    else
      cookbook.add_recipe_association(recipe)
    end

    redirect_to user_cookbook_path(@authenticated_user, cookbook)
  end

  def remove_recipe
    cookbook = Cookbook.find(params[:cookbook_id])
    cookbook.remove_recipe_association(params[:id])

    redirect_to user_cookbook_path(@authenticated_user, cookbook)
  end

  private
    def create_params
      create_params = params.require(:cookbook).permit(:name, :description, :user_id)
      create_params[:user_id] = @authenticated_user

      return create_params
    end

    def set_cookbook
      @cookbook = Cookbook.find(params[:id])
    end
end
