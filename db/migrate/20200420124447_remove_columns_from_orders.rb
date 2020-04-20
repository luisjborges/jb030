class RemoveColumnsFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :total
  end
end
