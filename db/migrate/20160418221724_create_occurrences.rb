class CreateOccurrences < ActiveRecord::Migration[5.0]
  def change
    create_table :occurrences do |t|
      t.string :name
      t.integer :startyear
      t.integer :endyear
      t.timestamps
    end
  end
end
