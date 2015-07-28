class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name, null: false, uniqueness: true
      t.string :image

      t.timestamps null: false
    end
  end
end
