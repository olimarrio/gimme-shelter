class Hostel < ApplicationRecord
  monetize :price_cents
  has_many :users, through: :bookings
  has_many :bookings
  validates :name, presence: true
  validates :address, presence: true
  # validates :description, presence: true
  # validates :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_address,
    against: [ :address ],
    using: {
      tsearch: {any_word: true}
      # tsearch: {prefix: true}
    }

   pg_search_scope :search_room_type,
    against: [ :female ],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_pets,
    against: [ :pets ],
    using: {
      tsearch: { prefix: true }
    }

   pg_search_scope :search_alcohol,
    against: [ :alcohol],
    using: {
      tsearch: { prefix: true }
    }


end
