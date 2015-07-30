class AddImageToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :image, :string
  end
end
