class CreateCookbooks < ActiveRecord::Migration
  def change
    create_table :cookbooks do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
