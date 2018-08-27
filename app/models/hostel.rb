class Hostel < ApplicationRecord
  has_many :users, through: :bookings
end
