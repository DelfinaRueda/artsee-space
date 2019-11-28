class Order < ApplicationRecord
  belongs_to :user
  belongs_to :artwork
  monetize :amount_cents
end
