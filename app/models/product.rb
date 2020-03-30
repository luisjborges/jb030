class Product < ApplicationRecord
  validates :title , presence: true
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  # :description :price :color :size :delivery :fabric :photo
end
