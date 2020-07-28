class City < ApplicationRecord
  belongs_to :prefecture
  has_many :weather_forecasts, dependent: :destroy
  validates :name, presence: true
  validates :romaji, presence: true
  validates :location_id, presence: true
end
