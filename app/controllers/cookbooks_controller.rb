class CookbooksController < ApplicationController
  before_action :set_cookbook, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create]
  # before_action :correct_user, except: [:new, :create]

  def index
    @cookbooks = Cookbook.where("user_id = ?", params[:user_id])
  end

  def show; end

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.new(cookbook_params)
    if @cookbook.save
      redirect_to user_cookbooks_path(@cookbook.user_id)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @cookbook.update(cookbook_params)

    if @cookbook.save
      redirect_to user_cookbooks_path(@cookbook.user_id)
    else
      render :edit
    end
  end

  def destroy
    @cookbook.destroy
    redirect_to user_cookbooks_path(@cookbook.user_id)
  end


  private

      def set_cookbook
        @cookbook = Cookbook.find(params[:id])
      end

      def cookbook_params
        params.require(:cookbook).permit(:name, :description, :user_id)
      end


end
