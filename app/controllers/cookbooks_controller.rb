class CookbooksController < ApplicationController
  def show
    @cookbook = Cookbook.find(params[:id])
    @owner = User.find(@cookbook.user_id).name
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

    redirect_to dashboard_user_path(user)
    # post = Post.find(params[:post][:id])
    #  category = post.categories.find(params[:category][:id])
    #
    #  if category
    #     post.categories.delete(category)
    #  end
  end

  private

  def cookbook_params
    params.require(:cookbook).permit(:name, :description, :user_id)
  end

end
