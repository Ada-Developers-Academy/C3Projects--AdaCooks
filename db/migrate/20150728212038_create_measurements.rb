class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :amount, required: true
      t.integer :ingredient_id, required: true, index: true
      t.integer :step_id, required: true, index: true
      t.integer :recipe_id, required: true, index: true

      t.timestamps null: false
    end
  end
end
