class Subscriber < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email, presence: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
