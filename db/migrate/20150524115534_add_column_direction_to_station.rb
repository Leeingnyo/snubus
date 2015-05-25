class AddColumnDirectionToStation < ActiveRecord::Migration
  def change
    add_column :stations, :direction, :string
  end
end
