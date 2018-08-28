class Hostel < ApplicationRecord
  has_many :users, through: :bookings
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
