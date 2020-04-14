class Product < ApplicationRecord
  belongs_to :user
  validates :title, :description, :price, :size, :color, :fabric, :delivery, :photo, presence: true
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  monetize :price_cents
end
