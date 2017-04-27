class AddColumnsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commenter, :string
    add_reference :comments, :post, index: true, foreign_key: true
  end
end
