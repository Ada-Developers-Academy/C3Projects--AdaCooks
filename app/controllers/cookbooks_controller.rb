class CookbooksController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :check_user_params, except: [:show]

  def show
    @cookbook = Cookbook.find(params[:id])
    @recipes = @cookbook.recipes
  end

  def new
    @user = User.find(params[:user_id])
    @cookbook = Cookbook.new
  end

  def create
    @cookbook = Cookbook.create(cookbook_params)
    if @cookbook.save
      redirect_to dashboard_user_path(@cookbook.user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @cookbook = Cookbook.find(params[:id])
  end

  def update
    user = User.find(params[:user_id])
    cookbook = Cookbook.find(params[:id])

    if user.id == cookbook.user.id
      if cookbook.update(cookbook_params)
        redirect_to dashboard_user_path(user)
      else
        render :edit
      end
    end
  end

  def destroy
    user = User.find(params[:user_id])
    cookbook = Cookbook.find(params[:id])
    if user.id == cookbook.user_id
      cookbook.destroy
      redirect_to dashboard_user_path(user)
    end
  end

  def destroy_recipe_assoc
    user = User.find(params[:user_id])
    cookbook = Cookbook.find(params[:cookbook_id])
    recipe = Recipe.find(params[:recipe_id])

    if recipe
      cookbook.recipes.destroy(recipe)
    end

    redirect_to user_cookbook_path(user, cookbook)
  end

  private

  def cookbook_params
    params.require(:cookbook).permit(
      :name,
      :description,
      :user_id,
      :ingredients,
      recipe_ids: [])
  end

end
