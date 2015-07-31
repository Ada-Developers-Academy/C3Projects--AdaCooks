class IngredientsRecipes < ActiveRecord::Migration
  def change
    create_table :ingredients_recipes, id: false do |t|
      t.belongs_to :ingredient, index: true
      t.belongs_to :recipe, index: true
    end
  end
end
