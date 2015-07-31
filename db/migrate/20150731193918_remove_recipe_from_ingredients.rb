class RemoveRecipeFromIngredients < ActiveRecord::Migration
  def change
    remove_reference :ingredients, :recipe, index: true, foreign_key: true
  end
end
