class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.text :preparation
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
