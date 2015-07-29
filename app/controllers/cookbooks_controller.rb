class CookbooksController < ApplicationController
  # before_action :get_user, only: [:new, :create]

  def new
    @cookbook = Cookbook.new
  end

  private

  # def get_user
  #   @user = User.find(params[:user_id])
  # end
end
