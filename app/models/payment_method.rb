class PaymentMethod < ApplicationRecord
  has_many :bookings
end
