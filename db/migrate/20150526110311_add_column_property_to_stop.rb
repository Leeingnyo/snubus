class AddColumnPropertyToStop < ActiveRecord::Migration
  def change
    add_column :stops, :property, :string
  end
end
