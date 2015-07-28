class CreateJoinTableCookbooksRecipes < ActiveRecord::Migration
  def change
    create_join_table :cookbooks, :recipes do |t|
       t.index [:cookbook_id, :recipe_id]
       t.index [:recipe_id, :cookbook_id]
    end
  end
end
