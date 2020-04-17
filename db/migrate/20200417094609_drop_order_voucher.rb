class DropOrderVoucher < ActiveRecord::Migration[6.0]
  def change
    drop_table :order_vouchers
  end
end
