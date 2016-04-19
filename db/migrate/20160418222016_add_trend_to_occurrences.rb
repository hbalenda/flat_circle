class AddTrendToOccurrences < ActiveRecord::Migration[5.0]
  def change
    add_column :occurrences, :trend_id, :integer
    add_index :occurrences, :trend_id
  end
end
