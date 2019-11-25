class Gallery < ApplicationRecord
  belongs_to :user
  has_many :artworks
end
