class Subscriber < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
