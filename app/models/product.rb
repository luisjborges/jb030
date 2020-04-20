class Product < ApplicationRecord
  belongs_to :user
  validates :sku, :name, :description, :price, :delivery, :note, :photo, presence: true
  has_many_attached :photos
  monetize :price_cents
end
