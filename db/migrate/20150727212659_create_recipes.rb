class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :desc
      t.string :image
      t.text :prep
      # t.references :ingredient, index: true, foreign_key: true
      # t.references :cookbook, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
