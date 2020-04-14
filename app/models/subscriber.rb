class Subscriber < ApplicationRecord
  validates :name, presence: true
  validates :email, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
