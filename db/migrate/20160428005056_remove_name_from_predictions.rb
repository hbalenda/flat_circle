class RemoveNameFromPredictions < ActiveRecord::Migration[5.0]
  def change
    remove_column :predictions, :name, :string
  end
end
