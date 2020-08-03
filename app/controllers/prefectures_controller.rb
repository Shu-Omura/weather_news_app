class PrefecturesController < ApplicationController
  def index
    @prefectures = Prefecture.all
    @weather_forecasts = WeatherForecast.all
    city_list = ['札幌', '仙台', '東京', '新潟', '金沢', '大阪', '高知', '広島', '福岡', '那覇']
    @weather_forecasts = WeatherForecast.joins(:city).where(cities: { name: city_list }).today_at_noon
  end
end
