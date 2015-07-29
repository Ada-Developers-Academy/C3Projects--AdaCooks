class CookbooksController < ApplicationController

  before_action :login_required
  before_action :belongs_to_user, except: [:index, :new]

  def index
    @user = User.find(session[:user_id])
    @cookbooks = @user.cookbooks
  end

  def show
    @cookbook_id = params[:id]
    @cookbook = Cookbook.find(@cookbook_id)
  end

  def new
    @cookbook = Cookbook.new(cookbook_params[:cookbook])
  end

  def create
    @cookbook = Cookbook.new(cookbook_params[:cookbook])
    if @cookbook.save
      redirect_to user_cookbook_path(@cookbook.id)
    else
      flash[:error]
      redirect_to new_user_cookbook_path
    end
  end

  private

  def cookbook_params
    params.permit(cookbook: [:name, :user_id, :description])
  end

  def belongs_to_user
  @cookbook = Cookbook.find(params[:id])
    if @cookbook.user_id != session[:user_id]
      redirect_to user_path(@cookbook.user_id)
    end
  end
end
