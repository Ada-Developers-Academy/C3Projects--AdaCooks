class CookbooksController < ApplicationController
  before_action :require_user_login

  def index
    @user = User.find(params[:user_id])
    @cookbooks = @user.cookbooks
  end

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.create(create_params)

    redirect_to user_cookbooks_path(session[:user_id])
  end

  def edit
  end

  def update
  end

  def show
    @cookbook = Cookbook.find(params[:id])
    @recipes = @cookbook.recipes
  end

  def destroy
  end

  private
    def create_params
      create_params = params.require(:cookbook).permit(:name, :description, :user_id)
      create_params[:user_id] = session[:user_id]

      return create_params
    end
end
