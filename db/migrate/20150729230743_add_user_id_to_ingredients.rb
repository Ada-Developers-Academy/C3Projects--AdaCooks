class AddUserIdToIngredients < ActiveRecord::Migration
  def up
    add_column :ingredients, :user_id, :integer, index: true

    if User.first
      Ingredient.all.update_all(user_id: User.first.id)
    end

    change_column_null :ingredients, :user_id, false
  end

  def down
    remove column :ingredients, :user_id
  end
end
