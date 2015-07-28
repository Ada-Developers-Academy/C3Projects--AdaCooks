class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :amount, null: false
      t.integer :ingredient_id, null: false, index: true
      t.integer :step_id, null: false, index: true
      t.integer :recipe_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
