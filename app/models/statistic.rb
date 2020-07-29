class Statistic < ApplicationRecord
  belongs_to :city
  validates :date, presence: true

  def weather_condition
    case weather_d
    when '快晴'
      '快晴'
    when /晴/
      '晴れ'
    when /雪/
      '雪'
    when '大雨'
      '雨'
    when /雨/
      '小雨'
    else
      '曇り'
    end
  end
end
