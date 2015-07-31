class StepsController < ApplicationController
  before_action :require_login # TODO: test this
  before_action :set_recipe, only: [:new, :create]
  # TODO: authenticate users!

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

  private
    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def create_params
      params.require(:step).permit(:directions)
    end
end
