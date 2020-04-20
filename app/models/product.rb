class Product < ApplicationRecord
  belongs_to :user
  validates :sku, :name, :description, :price, :delivery, :note, :photo, presence: true
  has_many :pictures, dependent: :destroy
  monetize :price_cents
end
