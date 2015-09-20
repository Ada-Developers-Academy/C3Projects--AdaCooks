class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :image
      # t.references :recipe, index: true, foreign_key: true
      # t.references :cookbook, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
