class CookbooksController < ApplicationController
  before_action :set_cookbook, only: [:edit, :update]

  MESSAGES = {
    create_success: "You have successfully created a new cookbook.",
    create_fail: "There was a problem with your new cookbook. Please try again.",
    update_success: "You have successfully updated your cookbook.",
    update_fail: "There was a problem with your update. Please try again."
  }

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.new(cookbook_params)

    if @cookbook.save
      flash[:success] = MESSAGES[:create_success]
      # redirect_to cookbook_path
      redirect_to root_path
    else
      flash[:errors] = MESSAGES[:create_fail]
      render :new
    end
  end

  def edit
    # @cookbook = Cookbook.find(params[:id])
  end

  def update
    # @cookbook = Cookbook.find(params[:id])
    @cookbook.update(cookbook_params)
    if @cookbook.save
      flash[:success] = MESSAGES[:update_success]
      redirect_to root_path # @cookbook
    else
      flash[:errors] = MESSAGES[:update_fail]
      render :edit
    end
  end

  private

  def set_cookbook
    @cookbook = Cookbook.find(params[:id])
  end

  def cookbook_params
    params.require(:cookbook).permit(:name, :description, :user_id)
  end
end
