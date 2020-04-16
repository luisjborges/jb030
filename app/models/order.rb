class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :voucher
  monetize :amount_cents
end
