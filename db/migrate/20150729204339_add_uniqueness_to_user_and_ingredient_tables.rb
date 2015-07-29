class AddUniquenessToUserAndIngredientTables < ActiveRecord::Migration
  def change
    add_index :users, :username, :unique => true
    add_index :users, :email, :unique => true
    add_index :ingredients, :name, :unique => true
  end
end
