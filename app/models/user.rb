class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :artworks
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :galleries


  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :first_name, :last_name ],
  associated_against: {
    artworks: [ :category, :title, :description ]
  },
  using: {
    tsearch: { prefix: true }
  }

end

