class Motorcycle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos


  validates :description, :brand, :model, :year, :price_per_day, :motorcycle_type, presence: true
  validates :engine_size, :title, presence: true
end
