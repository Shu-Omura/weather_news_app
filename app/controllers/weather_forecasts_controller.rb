class WeatherForecastsController < ApplicationController
  def index
    @city = City.find(params[:city_id])
    @weather_forecasts = WeatherForecast.where(city: @city)
    # httpリクエスト
    uri = Rails.application.credentials.open_weather[:uri]
    query = { id: @city.location_id, units: 'metric', appid: Rails.application.credentials.open_weather[:appid] }

    client = HTTPClient.new
    request = client.get(uri, query)
    @response = JSON.parse(request.body)
  end
end
