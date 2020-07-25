class City < ApplicationRecord
  belongs_to :prefecture
  has_many :weather_forecasts, dependent: :destroy
end
