class AddPriceToVouchers < ActiveRecord::Migration[6.0]
  def change
    add_monetize :vouchers, :price, currency: { present: false }
  end
end
