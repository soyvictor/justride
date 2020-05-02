class AddTitleToMotorcycles < ActiveRecord::Migration[6.0]
  def change
    add_column :motorcycles, :title, :string
  end
end
