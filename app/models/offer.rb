class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  
  validates :title, :brand, :price, presence: true
end
