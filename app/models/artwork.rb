class Artwork < ApplicationRecord
  has_one_attached :photo
  belongs_to :gallery
  belongs_to :user
  has_many :comments, dependent: :destroy



  include PgSearch::Model
  pg_search_scope :global_search,
  against: [:category, :title, :description],
  associated_against: {
    user: [ :first_name, :last_name ]
  },
  using: {
    tsearch: { prefix: true }
  }

end
