class MotorcyclesController < ApplicationController

  def index
    @motorcycles = Motorcycle.all
    @search = params["search"]
      if @search.present?
        @description = @search["description"]
        @motorcycles = Motorcycle.where(description: @description)
      end
    end


  def show

  end

end
