class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|

      t.integer :recipe_id, null: false
      t.integer :ingredient_id, null: false
      t.integer :quantity
      t.string :measurement
      t.timestamps null: false
    end
  end
end
