class AddColumnToCookbooks < ActiveRecord::Migration
  def change
    add_column :cookbooks, :user_id, :integer
  end
end
