class AddColumnsToIngredientTable < ActiveRecord::Migration
  def change
    add_column :ingredients, :name, :string
  end
end
