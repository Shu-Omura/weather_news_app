require 'rails_helper'

RSpec.describe 'WeatherForecasts', type: :request do
  let!(:weather_forecast) { create(:weather_forecast, city: city) }
  let!(:weather_forecast_2) { create(:weather_forecast, :tomorrow, city: city) }
  let(:city) { create(:city) }

  describe 'GET #index' do
    before { get city_weather_forecasts_path(city) }

    it 'returns http 200' do
      expect(response).to have_http_status(200)
    end

    it 'shows city names' do
      expect(response.body).to include city.name
    end

    it 'shows weather_forecast temp_max' do
      expect(response.body).to include weather_forecast.temp_max.to_s
      expect(response.body).to include weather_forecast_2.temp_max.to_s
    end
  end
end
