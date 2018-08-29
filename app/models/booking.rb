class Booking < ApplicationRecord
  monetize :amount_cents
  belongs_to :user
  belongs_to :hostel
  # validates :date, presence: true

end
