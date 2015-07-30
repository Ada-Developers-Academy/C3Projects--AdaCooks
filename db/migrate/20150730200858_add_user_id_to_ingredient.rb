class AddUserIdToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :user_id, :string
  end
end
