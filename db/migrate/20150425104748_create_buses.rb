class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :line_id
      t.belongs_to :edge, :index => true
      t.integer :time

      t.timestamps null: false
    end
  end
end
