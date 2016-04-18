class AddUserToTrends < ActiveRecord::Migration[5.0]
  def change
    add_column :trends, :user_id, :integer
    add_index :trends, :user_id
  end
end
