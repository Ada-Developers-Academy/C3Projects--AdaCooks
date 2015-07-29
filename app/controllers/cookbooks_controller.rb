class CookbooksController < ApplicationController
  def show
    @cookbook = Cookbook.find(params[:id])
    @owner = User.find(@cookbook.user_id).name
    @recipes = @cookbook.recipes
  end

  def new
    @user = User.find(params[:user_id])
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.create(cookbook_params)
    if @cookbook.save
      redirect_to dashboard_user_path(@cookbook.user)
    else
      render :new
    end
  end

  private

  def cookbook_params
    params.require(:cookbook).permit(:name, :description, :user_id)
  end

end
