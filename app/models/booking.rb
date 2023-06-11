class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_one :review, dependent: :destroy

  enum status: [:pending, :confirmed, :rejected]
end
