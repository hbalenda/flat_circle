class AddNameToPredictions < ActiveRecord::Migration[5.0]
  def change
    add_column :predictions, :name, :string
  end
end
