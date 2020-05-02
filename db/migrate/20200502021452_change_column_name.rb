class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :motorcycles, :city, :address
  end
end
