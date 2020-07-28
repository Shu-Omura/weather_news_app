require 'rails_helper'
require 'rake'

RSpec.describe 'OpenWeatherApi' do
  let!(:city) { create(:city, location_id: 2128295) }
  
  before do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require 'tasks/open_weather_api'
    Rake::Task.define_task(:environment)
  end

  describe 'open_weather_api', vcr: true do
    subject { @rake['open_weather_api:weather_forecasts'].execute }

    it { expect{ subject }.to change(WeatherForecast, :count).by(16) }
  end
end
