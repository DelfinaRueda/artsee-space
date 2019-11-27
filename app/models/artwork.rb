class Artwork < ApplicationRecord
  has_one_attached :photo
  belongs_to :gallery
  belongs_to :user
  has_many :comments, dependent: :destroy
end
