class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string  :name,     null: false
      t.string  :avatar
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
