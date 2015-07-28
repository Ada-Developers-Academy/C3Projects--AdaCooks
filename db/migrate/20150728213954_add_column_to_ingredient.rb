class AddColumnToIngredient < ActiveRecord::Migration
  def change
    add_reference :ingredients, :user, index: true
  end
end
