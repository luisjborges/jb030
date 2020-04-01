class Product < ApplicationRecord
  belongs_to :user
  validates :title , presence: true
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  # :description :price :color :size :delivery :fabric :photo
end
