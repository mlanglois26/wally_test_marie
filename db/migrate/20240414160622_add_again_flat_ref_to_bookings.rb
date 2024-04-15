class AddAgainFlatRefToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :flat, foreign_key: true
  end
end
