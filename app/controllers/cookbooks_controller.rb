class CookbooksController < ApplicationController
  before_action :require_login

  def index # NOTE THIS LOGIC NEEDS TO GO INTO THE RECIPE & INGREDIENTS NOT COOKBOOKS AUGH
    if params[:id].nil?
      @cookbook = Cookbook.all # TODO THIS HAS TO BE ALPHABETICAL
    else
      @cookbook = Cookbook.where(user_id: params[:id]) # TODO ALSO ALPHABETICAL
    end
  end

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

  def destroy
    cookbook = Cookbook.find(params[:id])
    cookbook.destroy
    redirect_to cookbooks_path
  end

  private

  def cookbook_params
    params.require(:cookbook).permit(:name, :description)
  end

end
