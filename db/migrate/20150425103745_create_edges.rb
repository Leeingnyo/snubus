class CreateEdges < ActiveRecord::Migration
  def change
    create_table :edges do |t|
      t.string :line_id
      t.integer :edge_index
      t.string :from
      t.string :to
      t.integer :time

      t.timestamps null: false
    end
  end
end
