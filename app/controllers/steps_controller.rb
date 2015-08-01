class StepsController < ApplicationController
  before_action :require_login # TODO: test this
  before_action :set_step, only: [:edit, :update, :destroy] # TODO: test this
  before_action :set_recipe, only: [:new, :create]
  before_action :authenticate_user, only: [:edit, :update, :destroy]

  def new
    @step = Step.new
  end

  def create
    @step = Step.new_step(create_params, @recipe)

    if @step.save
      flash[:message] = { step: "Created successfully!" } # TODO: standardize flash messages / displays
      redirect_to recipe_path(@recipe)
    else
      flash.now[:error] = @step.errors # TODO: standardize flash messages / displays
      render :new
    end
  end

  def edit
    @measurement = Measurement.new
    @ingredients = Ingredient.by_name
  end

  def update
    if @step.update(create_params)
      flash[:message] = { step: "Updated successfully!" }
      redirect_to recipe_path(params[:recipe_id])
    else
      flash.now[:error] = @step.errors
      render :edit
    end
  end

  def destroy
    @step.destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  private
    def set_step
      @step = Step.find(params[:id])
    end

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def create_params
      params.require(:step).permit(:directions)
    end

    def authenticate_user
      redirect_to root_path unless @step.recipe.user_id == (session[:user_id]) # OPTIMIZE: this would be a good refactor point!
    end
end
