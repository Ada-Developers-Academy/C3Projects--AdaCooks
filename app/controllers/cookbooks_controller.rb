class CookbooksController < ApplicationController
  before_action :require_login

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.new(cookbook_params)
    @cookbook.user_id = session[:user_id]
    if @cookbook.save
      redirect_to cookbook_path(@cookbook)
    else
      flash[:warning] = "Cookbook needs a name."
      render :new
    end
  end

  def destory
    cookbook = Cookbook.find(params[:id])
    cookbook.destroy
    redirect_to cookbooks_path
  end

  private

  def cookbook_params
    params.require(:cookbook).permit(:name, :description)
  end

end
