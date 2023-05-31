class Offer < ApplicationRecord
  belongs_to :user
  validates :title, :brand, :price, presence: true
end
