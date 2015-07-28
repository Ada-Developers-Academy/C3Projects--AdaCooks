class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, required: true
      t.text :description
      t.string :image
      t.text :preparation, required: true
      t.integer :user_id, required: true, index: true

      t.timestamps null: false
    end
  end
end
