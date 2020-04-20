class Product < ApplicationRecord
  belongs_to :user
  validates :sku, :name, :description, :price, :delivery, :note, presence: true
  monetize :price_cents
  has_many :pictures, dependent: :destroy
end
