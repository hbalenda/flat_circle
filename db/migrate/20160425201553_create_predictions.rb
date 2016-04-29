class CreatePredictions < ActiveRecord::Migration[5.0]
  def change
    create_table :predictions do |t|
      t.integer :date

      t.timestamps
    end
  end
end
