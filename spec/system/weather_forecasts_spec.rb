require 'rails_helper'

RSpec.describe 'WeatherForecasts', type: :system do
  let(:prefecture) { create(:prefecture) }
  let(:city) { create(:city, prefecture: prefecture) }
  let!(:weather_forecast) { create(:weather_forecast, city: city) }
  let!(:weather_forecast_2) { create(:weather_forecast, :tomorrow, city: city) }

  before { visit root_url }

  it 'searchs weather_forecasts' do
    expect(page).to have_content prefecture.name
    click_link prefecture.name

    expect(current_path).to eq prefecture_cities_path(prefecture)
    expect(page).to have_content city.name
    click_link city.name

    expect(current_path).to eq city_weather_forecasts_path(city)

    expect(page).to have_content city.name
    expect(page).to have_content weather_forecast.temp_max
    expect(page).to have_content weather_forecast.temp_min
    expect(page).to have_content weather_forecast.temp_feel
    expect(page).to have_content weather_forecast.date.strftime('%m月%d日')

    within('header') { click_link '都道府県で調べる' }
    expect(current_path).to eq root_path
  end
end
