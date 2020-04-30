class Motorcycle < ApplicationRecord
  belongs_to :user

  validates :description, :brand, :model, :year, :price_per_day, :motorcycle_type, presence: true
  validates :engine_size, :title, presence: true
end
