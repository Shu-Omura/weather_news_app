class WeatherForecast < ApplicationRecord
  belongs_to :city
  validates_presence_of :temp_max, :temp_min, :weather_id, :date, :aquired_at

  scope :today, -> { where(date: Date.current.all_day).order(date: :desc) }
  scope :tomorrow, -> { where(date: Date.current.tomorrow.all_day).order(date: :desc) }

  def weather_condition
    case weather_id
    when 200..232 then '雷雨'
    when 300..321 then '霧'
    when 500..501 then '小雨'
    when 502..531 then '雨'
    when 600..622 then '雪'
    when 800..801 then '快晴'
    when 802      then '晴れ'
    when 803..804 then '曇り'
    end
  end

  def daytime?
    date.hour >= 6 && date.hour < 18
  end

  def temp_avg
    (temp_max + temp_min) / 2
  end

  def rainfall_avg
    rainfall / 3
  end
end
