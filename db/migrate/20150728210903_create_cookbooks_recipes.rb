class CreateCookbooksRecipes < ActiveRecord::Migration
  def change
    create_table :cookbooks_recipes do |t|
     t.belongs_to :cookbook, index: true, null: false
     t.belongs_to :recipe, index: true, null: false
    end
  end
end
