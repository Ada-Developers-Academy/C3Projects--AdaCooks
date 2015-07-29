class CookbooksController < ApplicationController
  def show
    @cookbook = Cookbook.find(params[:id])
    @owner = User.find(@cookbook.user_id).name
  end
end
