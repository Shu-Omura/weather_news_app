class Statistic < ApplicationRecord
  belongs_to :city
  validates :date, presence: true

  scope :recent, -> { order(date: :desc) }

  def weather_condition_d
    case weather_d
    when '快晴'
      '快晴d'
    when /晴/
      '晴れd'
    when /雪/
      '雪d'
    when '大雨'
      '雨d'
    when /雨/
      '小雨d'
    when /曇/
      '曇りd'
    else
      '霧d'
    end
  end

  def weather_condition_n
    case weather_n
    when '快晴'
      '快晴n'
    when /晴/
      '晴れn'
    when /雪/
      '雪n'
    when '大雨'
      '雨n'
    when /雨/
      '小雨n'
    when /曇/
      '曇りn'
    else
      '霧n'
    end
  end

  def self.today
    select do |s|
      s.date.strftime('%m%d') == Time.current.strftime('%m%d')
    end
  end

  def self.tomorrow
    select do |s|
      s.date.strftime('%m%d') == Time.current.tomorrow.strftime('%m%d')
    end
  end
end
