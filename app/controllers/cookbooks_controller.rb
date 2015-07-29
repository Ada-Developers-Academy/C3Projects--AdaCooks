class CookbooksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @cookbook = Cookbook.new
  end

  def create
    cookbook = Cookbook.create(create_params[:cookbook])
    user = User.find(session[:user_id])
    cookbook.user_id = user.id

    if cookbook.save
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def create_params
    params.permit(cookbook: [:name, :description, :user_id])
  end
end
