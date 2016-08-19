class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :photo_url
      t.string :preparation
      t.references :cookbook, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
