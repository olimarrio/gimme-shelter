class Hostel < ApplicationRecord
  monetize :price_cents
  has_many :users, through: :bookings
  has_many :bookings
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true }
    }

end
