class Statistic < ApplicationRecord
  belongs_to :cities
  validates :weather_d, optional: true
  validates :weather_n, optional: true
  validates :date, presence: true
end
