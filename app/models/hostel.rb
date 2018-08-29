class Hostel < ApplicationRecord
  has_many :users, through: :bookings
  has_many :bookings
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true

  include PgSearch
  pg_search_scope :search_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true }
    }

end
