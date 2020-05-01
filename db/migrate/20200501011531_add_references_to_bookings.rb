class AddReferencesToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :motorcycles, foreign_key:true
  end
end
