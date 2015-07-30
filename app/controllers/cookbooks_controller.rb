class CookbooksController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def show
    @cookbook = Cookbook.find(params[:id])
  end

  def new
    @cookbook = Cookbook.new
  end

  def create
    cookbook = Cookbook.create(create_params[:cookbook])
    user = User.find(session[:user_id])
    cookbook.user_id = user.id

    if cookbook.save
      redirect_to new_recipe_path
    else
      render :new
    end
  end

  def edit
    @cookbook = Cookbook.find(params[:id])
  end

  def update
    user = User.find(session[:user_id])
    cookbook = Cookbook.find(params[:id])
    cookbook.update(create_params[:cookbook])

    redirect_to user_path(user)
  end

  def destroy
    cookbook = Cookbook.find(params[:id])
    cookbook.unassociate_recipes

    user = User.find(cookbook.user_id)
    cookbook.destroy

    redirect_to user_path(user)
  end

  private

  def create_params
    params.permit(cookbook: [:name, :description, :user_id, :image])
  end
end
