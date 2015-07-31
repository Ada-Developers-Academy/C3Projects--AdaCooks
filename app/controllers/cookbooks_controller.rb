class CookbooksController < ApplicationController
  before_action :set_cookbook, only: [:edit, :update, :show, :destroy]
  before_action :current_user, only: [:create, :show, :edit, :update]

  before_action :require_owner, only: [:show, :edit, :update]

  after_action :last_page

  MESSAGES = {
    create_success: "You have successfully created a new cookbook.",
    create_fail: "There was a problem with your new cookbook. Please try again.",
    update_success: "You have successfully updated your cookbook.",
    update_fail: "There was a problem with your update. Please try again.",
    destroy_success: "You have successfully deleted the cookbook.",
    destroy_fail: "There was a problem with your cookbook deletion. Please try again.",
    not_yo_cookbook: "Don't be creepin' on other people's cookbooks."
  }

  def new
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.new(cookbook_params)
    @cookbook.user = @current_user

    if @cookbook.save
      flash[:success] = MESSAGES[:create_success]
      redirect_to cookbook_path(@cookbook)
    else
      flash[:errors] = MESSAGES[:create_fail]
      render :new
    end
  end

  def update
    @cookbook.update(cookbook_params)
    if @cookbook.save
      flash[:success] = MESSAGES[:update_success]
      redirect_to @cookbook
    else
      flash[:errors] = MESSAGES[:update_fail]
      render :edit
    end
  end

  def show
    @owner = User.find(@cookbook.user_id)
    @recipes = @cookbook.recipes.desc_by_update
  end

  def destroy
    cookbook_id = @cookbook.id
    @cookbook.destroy
    if Cookbook.find_by(id: cookbook_id)
      flash[:errors] = MESSAGES[:destroy_fail]
    else
      flash[:success] = MESSAGES[:destroy_success]
    end
    redirect_to my_cookbooks_path
  end

  def remove_recipe
    cookbook = Cookbook.find(params[:cookbook_id])
    recipe = Recipe.find(params[:id])
    if recipe && cookbook
      cookbook.recipes.delete(recipe)
      recipe.cookbooks.delete(cookbook)
      flash[:success] = MESSAGES[:remove_success]
    else
      flash[:error] = MESSAGES[:remove_fail]
    end
    redirect_to cookbook_path(cookbook)
  end

  private

  def require_owner
    if !@current_user
      flash[:errors] = MESSAGES[:not_signed_in]
      redirect_to signin_path
    elsif !@current_user.cookbooks.exists?(id: params[:id])
      flash[:errors] = MESSAGES[:not_yo_cookbook]
      redirect_to my_cookbooks_path
    end
  end

  def set_cookbook
    @cookbook = Cookbook.find(params[:id])
  end

  def cookbook_params
    params.require(:cookbook).permit(:name, :description, :user_id)
  end
end
