class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :description
      t.string :image
      t.text :preparation, null: false
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
