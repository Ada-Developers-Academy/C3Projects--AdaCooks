class CookbooksRecipes < ActiveRecord::Migration
  def change
    create_table :cookbooks_recipes, id: false do |t|
      t.integer :cookbook_id
      t.integer :recipe_id
    end
  end
end
