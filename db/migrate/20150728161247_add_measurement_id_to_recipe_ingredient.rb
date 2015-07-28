class AddMeasurementIdToRecipeIngredient < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :measurement_id, :integer
  end
end
