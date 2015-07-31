class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :cookbooks, :recipes do |t|
      t.index :cookbook_id
      t.index :recipe_id
    end
  end
end
