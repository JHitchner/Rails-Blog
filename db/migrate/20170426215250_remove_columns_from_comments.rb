class RemoveColumnsFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :post_id, :integer
    remove_column :comments, :user_id, :integer
  end
end
