class CookbooksRecipes < ActiveRecord::Migration
  def change
    create_table :cookbooks_recipes, id: false do |t|
      t.belongs_to :cookbooks, index: true
      t.belongs_to :recipes, index: true
    end
  end
end
