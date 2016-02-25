class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :number, null: false
      t.text :directions, null: false
      t.integer :recipe_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
