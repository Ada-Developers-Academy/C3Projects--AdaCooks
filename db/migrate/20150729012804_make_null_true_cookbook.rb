class MakeNullTrueCookbook < ActiveRecord::Migration
  def change
    change_column :cookbooks, :name, :string, :null => true
    change_column :cookbooks, :user_id, :integer, :null => true
  end
end
