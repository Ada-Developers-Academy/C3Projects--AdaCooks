class CookbooksController < ApplicationController
  before_action :require_login
  before_action :set_cookbook, only: [
    :show, :edit, :update, :destroy, :remove_recipe
  ]

  MESSAGES = {
    name: "Requires a name.",
    saved: "Successfully saved cookbook.",
    recipe: "Successfully removed recipe(s)."
  }

  # def index # NOTE THIS LOGIC NEEDS TO GO INTO THE RECIPE & INGREDIENTS NOT COOKBOOKS AUGH
  #   if params[:id].nil?
  #     @cookbook = Cookbook.all # TODO THIS HAS TO BE ALPHABETICAL
  #   else
  #     @cookbook = Cookbook.where(user_id: params[:id]) # TODO ALSO ALPHABETICAL
  #   end
  # end

  def index
    @cookbooks = Cookbook.by_user(session[:user_id]) # TODO SHOULD BE ALPHABETICAL?
  end

  def show
    @recipes = @cookbook.recipes
  end

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.new(cookbook_params)
    @cookbook.user_id = session[:user_id]
    if @cookbook.save
      flash[:success] = MESSAGES[:saved]
      redirect_to cookbook_path(@cookbook)
    else
      flash[:warning] = MESSAGES[:name]
      render :new
    end
  end

  def edit
  end

  def update
    if @cookbook.update(cookbook_params)
      flash[:success] = MESSAGES[:saved]
      redirect_to cookbook_path(@cookbook)
    else
      # BELOW: Had to do the below because @cookbook's values still change
      # from the #update mehod, and I want to return the original name.
      @cookbook.name = Cookbook.find(params[:id]).name
      flash.now[:warning] = MESSAGES[:name]
      render :edit
    end
  end

  def destroy
    @cookbook.destroy
    redirect_to cookbooks_path
  end

  def remove_recipe
    if params[:recipe].nil?
      @cookbook.recipes.destroy_all
    else
      recipe = Recipe.find(params[:recipe])
      @cookbook.recipes.destroy(recipe)
    end
    flash.now[:success] = MESSAGES[:recipe]
    redirect_to cookbook_path(@cookbook)
  end

  private

  def cookbook_params
    params.require(:cookbook).permit(:name, :description)
  end

  def set_cookbook
    @cookbook = Cookbook.find(params[:id])
  end

end
