class CookbooksController < ApplicationController

  before_action :login_required

  def index
    @user = User.find(session[:user_id])
    @cookbooks = @user.cookbooks
  end

  def show
    @cookbook_id = params[:id]
    @cookbook = Cookbook.find(@cookbook_id)
    @recipes = @cookbook.recipes
  end

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.new(cookbook_params)
    if @cookbook.save
      redirect_to cookbook_path(@cookbook)
    else
      flash[:error]
      render :new
    end
  end

  def edit
    @cookbook_id = params[:id]
    @cookbook = Cookbook.find(@cookbook_id)
  end

  def update
    @cookbook_id = params[:id]
    @cookbook = Cookbook.find(@cookbook_id)
    @cookbook.update(cookbook_params)
    redirect_to cookbook_path(@cookbook)
  end

  def destroy
    @cookbook_id = params[:id]
    @cookbook = Cookbook.find(@cookbook_id)
    @cookbook.destroy

    redirect_to user_cookbooks_path(session[:user_id])
  end

  def remove_recipe
    @cookbook_id = params[:id]
    @cookbook = Cookbook.find(@cookbook_id)
    cookbook.recipes.delete(recipe)

    redirect_to cookbook_path(@cookbook)
  end

  private

  def cookbook_params
    params.require(:cookbook).permit(:name, :user_id, :description)
  end

end
