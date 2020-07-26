require 'rails_helper'

RSpec.describe "WeatherForecasts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/weather_forecasts/index"
      expect(response).to have_http_status(:success)
    end
  end
end
