class AddYearToPredictions < ActiveRecord::Migration[5.0]
  def change
    add_column :predictions, :year, :integer
  end
end
