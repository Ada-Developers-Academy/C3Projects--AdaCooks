class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|

      t.string :name
      t.string :description
      t.string :instructions
      t.string :image
      t.integer :user_id
      t.integer :ingredient_id

      t.timestamps null: false
    end
  end
end
