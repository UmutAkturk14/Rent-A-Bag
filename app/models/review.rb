class Review < ApplicationRecord
  belongs_to :booking
  has_one :offer, through: :booking
  has_one :user, through: :booking


  validates :rating, inclusion: { in: 0...5 }
end
