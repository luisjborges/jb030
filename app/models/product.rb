class Product < ApplicationRecord
  belongs_to :user
  validates :sku, :name, :description, :price, :delivery, :note, :photo, presence: true
  has_one_attached :photo
  monetize :price_cents
  # has_many :reviews, dependent: :destroy
end
