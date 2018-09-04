class Service < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  #  include PgSearch
  # pg_search_scope :search_by_title_and_syllabus,
  #   against: [ :title ],
  #   using: {
  #     tsearch: { prefix: true }
    # }
end
