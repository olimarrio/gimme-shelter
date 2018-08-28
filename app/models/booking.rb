class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hostel
  validates :date, presence: true

end
