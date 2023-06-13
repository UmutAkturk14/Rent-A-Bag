class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  belongs_to :payment_method
  has_one :review, dependent: :destroy

  enum status: [:pending, :confirmed, :rejected]
end
