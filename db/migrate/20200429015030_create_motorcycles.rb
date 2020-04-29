class CreateMotorcycles < ActiveRecord::Migration[6.0]
  def change
    create_table :motorcycles do |t|
      t.string :description
      t.string :brand
      t.string :model
      t.integer :year
      t.integer :price_per_day
      t.boolean :gear_included, default:false
      t.string :type
      t.integer :engine_size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
