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

  def show
  end



end
