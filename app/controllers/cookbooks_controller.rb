class CookbooksController < ApplicationController
  before_action :require_login, only: [:show, :edit]

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
    @cookbook = Cookbook.find(params[:id])
    session[:cookbook_id] = @cookbook.id
    if session[:user_id] != @cookbook.user_id
      redirect_to user_path(session[:user_id])
    end

  end

  def edit
    @cookbook = Cookbook.find(params[:id])
    if session[:user_id] != @cookbook.user_id
      redirect_to user_path(session[:user_id])
    end
  end


  def destroy
    @cookbook = Cookbook.find(params[:id])
  end

  def update
    cookbook = Cookbook.find(params[:id])
    cookbook.update(cookbook_params)
    redirect_to user_path(session[:user_id])
  end

  def destroy
    cookbook = Cookbook.find(params[:id])
    cookbook.destroy
    redirect_to user_path(session[:user_id])
  end

  private

  def cookbook_params
    params.require(:cookbook).permit(:name, :description, {:recipe_ids => [] })
  end
end
