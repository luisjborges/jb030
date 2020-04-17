class RemovePriceFromOrderVouchers < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_vouchers, :amount_currency, :integer
  end
end
