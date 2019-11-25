class Artwork < ApplicationRecord
  belongs_to :gallery
  belongs_to :user
end
