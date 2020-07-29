class City < ApplicationRecord
  belongs_to :prefecture
  has_many :weather_forecasts, dependent: :destroy
  has_many :statistics, dependent: :destroy
  validates_presence_of :name, :romaji, :location_id
end
