class CreateCookbooks < ActiveRecord::Migration
  def change
    create_table :cookbooks do |t|
      t.string :name, required: true
      t.text :description
      t.integer :user_id, required: true, index: true

      t.timestamps null: false
    end
  end
end
