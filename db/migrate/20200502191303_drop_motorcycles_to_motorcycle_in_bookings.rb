class DropMotorcyclesToMotorcycleInBookings < ActiveRecord::Migration[6.0]
  def change
    remove_reference :bookings, :motorcycles, foreign_key:true
  end
end
