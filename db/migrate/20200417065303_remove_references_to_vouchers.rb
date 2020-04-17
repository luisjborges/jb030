class RemoveReferencesToVouchers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :voucher
  end
end
