class ChangeDescriptionToBeTextInMotorcycles < ActiveRecord::Migration[6.0]
  def change
     change_column :motorcycles, :description, :text
  end
end
