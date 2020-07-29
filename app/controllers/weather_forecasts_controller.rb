class WeatherForecastsController < ApplicationController
  def index
    @city = City.find(params[:city_id])
    @weather_forecasts = WeatherForecast.where(city: @city)
    @statistics = Statistic.where(city: @city).recent
  end
end
