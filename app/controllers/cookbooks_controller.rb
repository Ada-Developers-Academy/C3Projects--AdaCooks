class CookbooksController < ApplicationController
  before_action :require_login, only: [:show]
  before_action :find_cookbook, only: [:show, :edit, :update, :destroy]

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.create(cookbook_params)
    @cookbook.user_id = session[:user_id]

    if @cookbook.save
        redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end

  def show
    session[:cookbook_id] = @cookbook.id
  end

  def edit
    if session[:user_id] != @cookbook.user_id
      redirect_to user_path(session[:user_id])
    end
  end

  def update
    @cookbook.update(cookbook_params)
    redirect_to user_path(session[:user_id])
  end

  def destroy
    @cookbook.destroy
    redirect_to user_path(session[:user_id])
  end

  private
  def find_cookbook
    @cookbook = Cookbook.find(params[:id])
  end

  def cookbook_params
    params.require(:cookbook).permit(:name, :description, {:recipe_ids => [] })
  end
end
