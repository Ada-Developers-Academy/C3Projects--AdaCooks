class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :description
      t.blob :image
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
