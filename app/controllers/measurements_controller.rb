class MeasurementsController < ApplicationController
  def create
    measurement = Measurement.create(create_params)
    flash[:error] = measurement.errors if measurement.errors.any?
    redirect_to edit_recipe_step_path(recipe_id: params[:measurement][:recipe_id], id: params[:measurement][:step_id])
  end

  private
    def create_params
      params.require(:measurement).permit(:amount, :ingredient_id, :step_id, :recipe_id)
      # NOTE: this is a huge security vulnerability --
      # if someone changed the HTML on the page, they could modify the
      # ids, and we do not have any authentication checks at this level.
      # Perhaps if this had posted to a different controller, or if measurements were nested
      # in the routes file, this would've been easier to handle?
      # As it is, we ran out of time to explore this more. >_>
    end
end
