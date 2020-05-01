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
    @motorcycles = Motorcycle.where(user: current_user)
  end

  def new
    @motorcycle = Motorcycle.new
  end

  def create
    @motorcycle = Motorcycle.new(motorcycle_params)
    @motorcycle.user = current_user
    @motorcycle.save
    redirect_to motorcycle_path(@motorcycle)
  end

  def show
  end

  def edit
    @motorcycle = Motorcycle.find(params[:id])
  end

  def update
    @motorcycle = Motorcycle.find(params[:id])
    @motorcycle.update(motorcycle_params)
    redirect_to motorcycle_path(@motorcycle)
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:brand, :model, :year, :engine_size, :title, :description, :gear_included, :price_per_day, :motorcycle_type, :photo)
  end

end
