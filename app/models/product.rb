class Product < ApplicationRecord
  validates :title , presence: true
  has_many :reviews, dependent: :destroy
  # :description :price :color :size :delivery :fabric :photo
end
