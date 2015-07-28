class UpdateStepsToTextDataType < ActiveRecord::Migration
  def change
    change_column :recipes, :steps, :text
  end
end
