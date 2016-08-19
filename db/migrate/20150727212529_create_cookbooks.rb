class CreateCookbooks < ActiveRecord::Migration
  def change
    create_table :cookbooks do |t|
      t.string :name
      t.string :description
      t.string :photo_url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
