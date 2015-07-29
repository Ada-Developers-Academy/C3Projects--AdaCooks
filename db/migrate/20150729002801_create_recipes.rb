class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :image_url
      t.string :prep, null: false
      t.integer :cookbook_id, null: false

      t.timestamps null: false
    end
  end
end
