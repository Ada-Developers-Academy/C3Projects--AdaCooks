class RenameImageColumnOnRecipes < ActiveRecord::Migration
  def change
    rename_column :recipes, :image_url, :image
  end
end
