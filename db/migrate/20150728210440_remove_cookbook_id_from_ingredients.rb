class RemoveCookbookIdFromIngredients < ActiveRecord::Migration
  def change
    remove_column :ingredients, :cookbook_id, :integer
  end
end
