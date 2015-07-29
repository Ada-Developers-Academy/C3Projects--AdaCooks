class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :recipes, :ingredients do |t|
      t.index [:recipe_id, :ingredient_id]
      t.index [:ingredient_id, :recipe_id]
    end
  end
end
