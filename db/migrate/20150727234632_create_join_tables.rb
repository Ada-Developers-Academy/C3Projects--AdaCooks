class CreateJoinTables < ActiveRecord::Migration
  def change
    create_join_table :cookbooks, :recipes do |t|
      t.index [:cookbook_id, :recipe_id]
      t.index [:recipe_id, :cookbook_id]
    end

    create_join_table :recipes, :ingredients do |t|
      t.index [:recipe_id, :ingredient_id]
      t.index [:ingredient_id, :recipe_id]
    end
  end
end
