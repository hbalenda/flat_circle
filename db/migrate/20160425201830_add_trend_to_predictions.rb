class AddTrendToPredictions < ActiveRecord::Migration[5.0]
  def change
    add_column :predictions, :trend_id, :integer
    add_index :predictions, :trend_id
  end
end
