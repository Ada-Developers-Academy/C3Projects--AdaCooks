class CookbooksController < ApplicationController

  before_action :login_required

  def index
    @user = User.find(session[:user_id])
    @cookbooks = @user.cookbooks
  end

  def show
    @cookbook_id = params[:id]
    @cookbook = Cookbook.find(@cookbook_id)
    @recipes = @cookbook.recipes
    if session[:user_id]
      if session[:user_id] == @cookbook.user_id
        render :show
      else
        redirect_to root_path
      end
    end
  end

  def new
    @cookbook = Cookbook.new
    if session[:user_id]
      if session[:user_id] == @cookbook.user_id
        render :new
      else
        redirect_to root_path
      end
    end
  end

  def create
    @cookbook = Cookbook.new(cookbook_params)
    if @cookbook.save
      redirect_to cookbook_path(@cookbook)
    else
      flash[:errors] = error_messages(@cookbook)
      render :new
    end
  end

def edit
  @cookbook_id = params[:id]
  @cookbook = Cookbook.find(@cookbook_id)
    if session[:user_id]
      if session[:user_id] == @cookbook.user_id
        render :edit
      else
        redirect_to root_path
      end
    end
  end

  def update
    unless params.include? :recipe
      @cookbook_id = params[:id]
      @cookbook = Cookbook.find(@cookbook_id)
      @cookbook.update(cookbook_params)
      if @cookbook.save
        redirect_to cookbook_path(@cookbook)
      else
        flash[:errors] = error_messages(@cookbook)
        render :edit
      end

    else
      cookbook = Cookbook.find(params[:recipe][:cookbook_id])
      cookbook.recipes << Recipe.find(params[:id])
      flash[:notice] = "This recipe has been successfully added to '#{cookbook.name}.'"
      redirect_to recipe_path(params[:id])
    end
  end

  def destroy
    @cookbook_id = params[:id]
    @cookbook = Cookbook.find(@cookbook_id)
    @cookbook.destroy

    redirect_to user_cookbooks_path(session[:user_id])
  end

  def remove_recipe
    @cookbook = Cookbook.find(params[:id])
    @recipe = Recipe.find(params[:recipe])
    @cookbook.recipes.delete(@recipe)

    redirect_to cookbook_path(@cookbook)
  end
  # def rm_recipe
  #   @cookbook = Cookbook.find(params[:cookbook])
  #   @recipe = Recipe.find(params[:recipe])
  #   @recipe.cookbook_id = nil
  #   @recipe.save
  #
  #   redirect_to user_path(session[:user_id], :cookbook => @cookbook.id)
  # end
  private

  def cookbook_params
    params.require(:cookbook).permit(:name, :user_id, :description)
  end

  def recipe_params
    params.require(:recipe).permit(:cookbook_id)
  end
end
