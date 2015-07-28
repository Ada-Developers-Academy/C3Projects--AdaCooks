class CreateCookbooksRecipes < ActiveRecord::Migration
  def change
    create_table :cookbooks_recipes do |t|
     t.belongs_to :cookbook, index: true, required: true
     t.belongs_to :recipe, index: true, required: true
    end
  end
end
