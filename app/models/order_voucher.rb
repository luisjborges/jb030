class OrderVoucher < ApplicationRecord
  belongs_to :user
  belongs_to :voucher
  monetize :amount_cents
end
