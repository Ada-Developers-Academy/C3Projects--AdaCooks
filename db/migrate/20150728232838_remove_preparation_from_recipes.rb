class RemovePreparationFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :preparation, :text, null: false
  end
end
