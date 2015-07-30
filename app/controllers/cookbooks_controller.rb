class CookbooksController < ApplicationController

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
  end

  def destroy
    @cookbook = Cookbook.find(params[:id])
    @cookbook.destroy
    redirect_to user_path(session[:user_id])
  end


  private

  def cookbook_params
    params.require(:cookbook).permit(:name, :description)
  end
end
