class Motorcycle < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  validates :description, :brand, :model, :year, :price_per_day, :motorcycle_type, presence: true
  validates :engine_size, :title, presence: true
end
