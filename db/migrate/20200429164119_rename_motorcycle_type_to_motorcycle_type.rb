class RenameMotorcycleTypeToMotorcycleType < ActiveRecord::Migration[6.0]
  def change
    rename_column :motorcycles, :type, :motorcycle_type
  end
end
