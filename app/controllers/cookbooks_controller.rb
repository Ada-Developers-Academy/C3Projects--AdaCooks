class CookbooksController < ApplicationController
  before_action :require_login
  before_action :define_user
  before_action :find_cookbook, only: [:edit, :update, :destroy]

  # Display cookbook(s)
  def show; end

  # Add a new cookbook
  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.new(cookbook_params)
    if @cookbook.save
      redirect_to user_path(session[:user_id])
    else
      render new_cookbook_path
    end
  end

  # Edit an existing cookbook
  def edit; end

  def update
    @cookbook.update(cookbook_params)

    redirect_to user_path
  end

  # Delete a cookbook
  def destroy
    @cookbook.destroy

    redirect_to user_path
  end

  # Delete a recipe
  def rm_recipe
    @cookbook = Cookbook.find(params[:cookbook])
    @recipe = Recipe.find(params[:recipe])
    ids = @recipe.cookbook_ids.delete_if { |id| id == @cookbook.id }
    @recipe.cookbook_ids = ids

    redirect_to user_path(session[:user_id], :cookbook => @cookbook.id)
  end

end

private

  def find_cookbook
    @cookbook = Cookbook.find(params[:id])
  end

  def cookbook_params
    params.require(:cookbook).permit(:name, :desc, :user_id)
  end
