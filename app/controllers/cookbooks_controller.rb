class CookbooksController < ApplicationController
  def index
  end

  def new
  end

  def create
    @cookbook = Cookbook.create(cookbook_params)
    @cookbook.user_id = session[:user_id]

    if @cookbook.save
        redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end

  private

  def recipe_params
    params.require(:cookbook).permit(:name, :description, {:recipe_ids => [] })
  end
end
