class MotorcyclesController < ApplicationController

before_action :set_motorcycle, only: [:show, :edit, :update, :destroy]

  def index
    @motorcycles = Motorcycle.all
    @search = params["search"]
      if @search.present?
        @address = @search["address"]
        @motorcycles = Motorcycle.near(@address, 100)
      end

       @markers = @motorcycles.map do |motorcycle|
      {
        lat: motorcycle.latitude,
        lng: motorcycle.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { motorcycle: motorcycle })
      }
    end
  end

  def my_motorcycles
    @motorcycles = Motorcycle.where(user: current_user)
  end

  def my_motorcycles_host
    # <li><%= link to motorcycle.id, ......_path(motorcycle) %><li>
    @motorcycles = Motorcycle.where(user: current_user)
  end

  def new
    @motorcycle = Motorcycle.new
  end

  def create
    @motorcycle = Motorcycle.new(motorcycle_params)
    @motorcycle.user = current_user
    if @motorcycle.save
      redirect_to motorcycle_path(@motorcycle)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
  end

  def edit
  end

  def update

    if @motorcycle.update(motorcycle_params)
      redirect_to motorcycle_path(@motorcycle)
    else
      render :edit
    end
  end

  def destroy
    @motorcycle.destroy
    redirect_to my_motorcycles_motorcycles_path
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:brand, :model, :year, :engine_size, :title, :description, :gear_included, :price_per_day, :motorcycle_type, :address, photos: [])
  end

  def set_motorcycle
    @motorcycle = Motorcycle.find(params[:id])
  end

end
