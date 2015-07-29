class CookbooksController < ApplicationController
  before_action :set_cookbook, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create]
  before_action :correct_user, except: [:new, :create]

  def index
    @cookbooks = Cookbook.where("user_id = ?", params[:id])
  end

  def show; end

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.new(cookbook_params)
    if @cookbook.save
      redirect_to cookbook_path(@cookbook)
    else
      render 'new'
    end
  end

  private

      def create_cookbook
        @cookbook = Cookbook.new
      end

      def set_cookbook
        @cookbook = Cookbook.find(params[:id])
      end

      def cookbook_params
        params.require(:cookbook).permit(:name, :image, :user_id)
      end


end
