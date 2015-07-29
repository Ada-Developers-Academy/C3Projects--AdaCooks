class CookbooksController < ApplicationController
  before_action :set_cookbook, only: [:edit, :update, :show, :destroy, :remove_recipe]
  before_action :current_user, only: [:edit, :update, :show, :destroy, :remove_recipe]

  MESSAGES = {
    create_success: "You have successfully created a new cookbook.",
    create_fail: "There was a problem with your new cookbook. Please try again.",
    update_success: "You have successfully updated your cookbook.",
    update_fail: "There was a problem with your update. Please try again.",
    destroy_success: "You have successfully deleted the cookbook.",
    destroy_fail: "There was a problem with your cookbook deletion. Please try again."
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

  def update
    @cookbook.update(cookbook_params)
    if @cookbook.save
      flash[:success] = MESSAGES[:update_success]
      redirect_to root_path # @cookbook
    else
      flash[:errors] = MESSAGES[:update_fail]
      render :edit
    end
  end

  def show
    @owner = User.find(@cookbook.user_id)
    @recipes = @cookbook.recipes # add scope? newest first?
  end

  def destroy
    cookbook_id = @cookbook.id
    @cookbook.destroy
    if Cookbook.find_by(id: cookbook_id)
      flash[:errors] = MESSAGES[:destroy_fail]
      redirect_to :back
    else
      flash[:success] = MESSAGES[:destroy_success]
      redirect_to root_path #user_path(@current_user)
    end
  end

  def remove_recipe
    # cookbook = Cookbook.find(params[:id])
    recipe = @cookbook.recipes.find(params[:id])
    raise
    if recipe && @cookbook
      @cookbook.recipes.delete(recipe)
      recipe.cookbooks.delete(@cookbook)
      flash[:success] = MESSAGES[:remove_success]
    else
      flash[:error] = MESSAGES[:remove_fail]
    end
      redirect_to user_cookbook_path(@user, @cookbook)
  end

  private

  def set_cookbook
    @cookbook = Cookbook.find(params[:id])
  end

  def cookbook_params
    params.require(:cookbook).permit(:name, :description, :user_id)
  end
end
