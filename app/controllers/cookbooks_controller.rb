class CookbooksController < ApplicationController

  def index
    @cookbooks = Cookbook.all
  end

  def show
    @cookbook_id = params[:id]
    @cookbook = Cookbook.find(@cookbook_id)
  end

  def new
    @cookbook = Cookbook.new(cookbook_params[:cookbook])
  end

  private

  def cookbook_params
    params.permit(cookbook: [:name, :user_id, :description])
  end
end
