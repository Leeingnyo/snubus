class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :line_id
      t.integer :edge_id
      t.integer :time

      t.timestamps null: false
    end
  end
end
