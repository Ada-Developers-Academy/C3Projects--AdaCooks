class CreateCookbooks < ActiveRecord::Migration
  def change
    create_table :cookbooks do |t|
      t.string :name
      t.integer :user_id
      t.string :description

      t.timestamps null: false
    end
  end
end
