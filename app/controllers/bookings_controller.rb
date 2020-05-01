class BookingsController < ApplicationController
  def index
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end
end
