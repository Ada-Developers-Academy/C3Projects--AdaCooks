class CookbooksController < ApplicationController
  before_action :require_user_login
  before_action :set_cookbook, only: [:edit, :show, :destroy]

  def index
    @user = User.find(params[:user_id])
    @cookbooks = @user.cookbooks
  end

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.create(create_params)

    redirect_to user_cookbook_path(session[:user_id], @cookbook.id)
  end

  def edit
  end

  def update
    @cookbook = Cookbook.update(params[:id], create_params)

    redirect_to user_cookbook_path(session[:user_id], @cookbook.id)
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

    redirect_to user_cookbooks_path(session[:user_id])
  end

  def add_recipe
  end

  def remove_recipe
    cookbook = Cookbook.find(params[:cookbook_id])
    cookbook.remove_recipe_association(params[:id])

    redirect_to user_cookbook_path(session[:user_id], cookbook)
  end

  private
    def create_params
      create_params = params.require(:cookbook).permit(:name, :description, :user_id)
      create_params[:user_id] = session[:user_id]

      return create_params
    end

    def set_cookbook
      @cookbook = Cookbook.find(params[:id])
    end
end
