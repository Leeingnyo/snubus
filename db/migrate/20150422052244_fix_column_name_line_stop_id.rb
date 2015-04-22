class FixColumnNameLineStopId < ActiveRecord::Migration
  def change
    rename_column :lines, :stop_id, :line_id
  end
end
