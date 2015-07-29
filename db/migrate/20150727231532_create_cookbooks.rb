class CreateCookbooks < ActiveRecord::Migration
  def change
    create_table :cookbooks do |t|
      t.string :name, null: false
      t.text :description
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
