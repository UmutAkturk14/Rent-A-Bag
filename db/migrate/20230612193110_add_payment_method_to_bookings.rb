class AddPaymentMethodToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :payment_method, null: false, foreign_key: true
  end
end
