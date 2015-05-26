class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :kind
      t.integer :arrival_time

      t.timestamps null: false
    end
  end
end
