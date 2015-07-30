class CookbooksController < ApplicationController
  before_action :require_login
  before_action :find_cookbook, only: [:show, :edit, :update]
  before_action :get_cookbook_associations, only: [:new, :edit]

  def show
    if session[:user_id] == params[:user_id].to_i
      @recipes = @cookbook.recipes
      @recipe_count = @recipes.count
      render :show
    else
      redirect_to root_path
    end
  end

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.new(create_cookbook_params)
    @cookbook.user_id = session[:user_id]

    if @cookbook.save
      redirect_to root_path, notice: "Cookbook added!"
    else
      flash.now[:error] = ERRORS[:unsuccessful_save]
      render :new
    end
  end

  def edit; end

  def update
    @cookbook.update(create_cookbook_params)
    @cookbook.recipe_ids = [] unless params[:cookbook][:recipe_ids]
    @cookbook.save

    redirect_to user_cookbook_path(session[:user_id], @cookbook.id)
  end

  private

  def create_cookbook_params    # note: access to associated objects (e.g., recipes) will be through that controller.
    params.require(:cookbook).permit(
      :name,
      :description,
      recipe_ids: []
    )
  end

  def find_cookbook
    @cookbook = Cookbook.find(params[:id])
  end

  def get_cookbook_associations
    @recipes = Recipe.all
    @cookbooks = Cookbook.where(user_id: session[:user_id])
  end
end
