class CreateCookbooks < ActiveRecord::Migration
  def change
    create_table :cookbooks do |t|
      t.string :name,        null: false
      t.string :description
      t.integer :user_id,    null: false

      t.timestamps null: false
    end
  end
end
