class CreateOrderVouchers < ActiveRecord::Migration[6.0]
  def change
    create_table :order_vouchers do |t|
      t.string :state
      t.string :voucher_sku
      t.monetize :amount, currency: { present: false }
      t.string :checkout_session_id
      t.references :user, null: false, foreign_key: true
      t.references :voucher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
