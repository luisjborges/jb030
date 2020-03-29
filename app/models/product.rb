class Product < ApplicationRecord
  validates :title , presence: true
  # :description :price :color :size :delivery :fabric :photo
end
