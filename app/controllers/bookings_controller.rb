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
    # if booking_params[:start_date].blank? or booking_params[:end_date].blank?

    #   @motorcycle = Motorcycle.find(params[:motorcycle_id])
    #   @booking = Booking.new

    #   render "motorcycles/show"
    # else
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      @motorcycle = Motorcycle.find(params[:motorcycle_id])
      @booking.motorcycle = @motorcycle
      if @booking.save
        redirect_to upcoming_bookings_bookings_path
      else
        @error = "Please provide pickup and dropoff dates"
        render "motorcycles/show"
      end

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :motorcycle_id)
  end

end
