class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :artwork

  validates :content, presence: true
end
