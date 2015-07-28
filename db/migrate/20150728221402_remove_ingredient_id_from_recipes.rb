class RemoveIngredientIdFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :ingredient_id, :integer
  end
end
