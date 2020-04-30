class MotorcyclesController < ApplicationController

  def index
    @motorcycles = Motorcycle.all
    @search = params["search"]
      if @search.present?
        @description = @search["description"]
        @motorcycles = Motorcycle.where(description: @description)
      end
  end

  def my_motorcycles
    @motorcycles = Motorcycle.all
  end

  def new
    @motorcycle = Motorcycle.new
  end

  def create
    @motorcycle = Motorcycle.new(motorcycle_params)
    @motorcycle.user = current_user
    @motorcycle.save
    redirect_to root_path
  end

  def show
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:brand, :model, :year, :engine_size, :title, :description, :gear_included, :price_per_day, :motorcycle_type, :photo)
  end

end
