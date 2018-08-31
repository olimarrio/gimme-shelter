class Service < ApplicationRecord
  include Filterable
  scope :starts_with, -> (category) { where("category like ?", "#{category}%")}
end
