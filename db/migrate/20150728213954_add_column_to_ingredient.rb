class AddColumnToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredient, :user, :references
  end
end
