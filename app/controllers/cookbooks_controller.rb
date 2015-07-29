class CookbooksController < ApplicationController
  MESSAGES = {
    cookbook_create_success: "You have successfully created a new cookbook.",
    cookbook_create_fail: "There was a problem with your new cookbook. Please try again."
  }

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.new(cookbook_params)

    if @cookbook.save
      flash[:success] = MESSAGES[:cookbook_create_success]
      # redirect_to cookbook_path
      redirect_to root_path
    else
      flash[:errors] = MESSAGES[:cookbook_create_fail]
      render :new
    end
  end

  private

  def cookbook_params
    params.require(:cookbook).permit(:name, :description, :user_id)
  end
end
