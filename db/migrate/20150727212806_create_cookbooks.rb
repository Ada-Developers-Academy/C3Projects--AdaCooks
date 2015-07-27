class CreateCookbooks < ActiveRecord::Migration
  def change
    create_table :cookbooks do |t|
      t.string :name
      t.text :desc
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
