class AddColumnsToIngredientTable < ActiveRecord::Migration
  def change
    add_column :ingredients, :name, :string
    add_column :ingredients, :image, :string
  end
end
