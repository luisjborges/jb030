class AdddSizeToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :size, :string
  end
end
