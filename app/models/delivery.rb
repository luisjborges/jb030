class Delivery < ApplicationRecord
  belongs_to :user
  belongs_to :order
  validates :first_name, :last_name, :email, presence: true
end
