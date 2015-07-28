class AddColumnsToRecipeTable < ActiveRecord::Migration
  def change
    add_column :recipes, :name, :string
    add_column :recipes, :description, :string
    add_column :recipes, :image, :string
    add_column :recipes, :preparation, :string
    add_column :recipes, :user_id, :integer
  end
end
