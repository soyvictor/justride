class AddCoordinatesToMotorcycles < ActiveRecord::Migration[6.0]
  def change
    add_column :motorcycles, :latitude, :float
    add_column :motorcycles, :longitude, :float
  end
end
