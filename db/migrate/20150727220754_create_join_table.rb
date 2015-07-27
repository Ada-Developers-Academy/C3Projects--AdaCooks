class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :recipes, :cookbooks do |t|
      # t.index [:recipe_id, :cookbook_id]
      # t.index [:cookbook_id, :recipe_id]
    end
  end
end
