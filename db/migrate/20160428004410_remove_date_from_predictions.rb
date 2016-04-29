class RemoveDateFromPredictions < ActiveRecord::Migration[5.0]
  def change
    remove_column :predictions, :date, :integer
  end
end
