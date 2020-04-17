class AddSkuToVouchers < ActiveRecord::Migration[6.0]
  def change
    add_column :vouchers, :sku, :string
  end
end
