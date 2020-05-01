class AddCityToMotorcycles < ActiveRecord::Migration[6.0]
  def change
    add_column :motorcycles, :city, :string
  end
end
