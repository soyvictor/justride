class AddReferenceToBooking < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :motorcycle, foreign_key:true
  end
end
