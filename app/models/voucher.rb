class Voucher < ApplicationRecord
  belongs_to :user
  validates :sku, :name, :description, :photo, presence: true
  has_one_attached :photo
  monetize :price_cents
end
