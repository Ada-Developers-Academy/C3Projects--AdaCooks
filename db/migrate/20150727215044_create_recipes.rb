class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :preparation

      t.timestamps null: false
    end
  end
end
