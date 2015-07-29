class CookbooksController < ApplicationController
  before_action :require_login, only: [:show]

  def show
    @cookbook = Cookbook.find(params[:id])
    @recipes = @cookbook.recipes
  end
end
