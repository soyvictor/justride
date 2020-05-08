class BookingsController < ApplicationController
  def index
  end

  def upcoming_bookings
    @bookings = Booking.where(user: current_user).where('end_date > ?', Date.today)
  end

  def past_bookings
    @bookings = Booking.where(user: current_user).where('end_date < ?', Date.today)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.motorcycle = Motorcycle.find(params[:motorcycle_id])
    @booking.save
    redirect_to upcoming_bookings_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :motorcycle_id)
  end

end
