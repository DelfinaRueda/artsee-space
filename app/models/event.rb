class Event < ApplicationRecord
  has_many :likes
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
