class AddReferencesToVouchers < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :voucher, foreign_key: true
  end
end
