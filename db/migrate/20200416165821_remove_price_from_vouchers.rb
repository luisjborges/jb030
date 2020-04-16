class RemovePriceFromVouchers < ActiveRecord::Migration[6.0]
  def change
    remove_column :vouchers, :price_cents, :integer
  end
end
