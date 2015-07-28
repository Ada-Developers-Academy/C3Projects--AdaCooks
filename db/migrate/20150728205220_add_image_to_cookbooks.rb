class AddImageToCookbooks < ActiveRecord::Migration
  def change
    add_column :cookbooks, :image, :string
  end
end
