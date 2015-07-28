class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :number, required: true
      t.text :directions, required: true
      t.integer :recipe_id, required: true, index: true

      t.timestamps null: false
    end
  end
end
