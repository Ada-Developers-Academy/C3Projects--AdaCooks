class CreateCookbooks < ActiveRecord::Migration
  def change
    create_table :cookbooks do |t|

      t.timestamps null: false
    end
  end
end
