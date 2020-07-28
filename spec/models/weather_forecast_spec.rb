require 'rails_helper'

RSpec.describe WeatherForecast, type: :model do
  describe 'validation' do
    subject { weather_forecast }

    describe 'factory' do
      let(:weather_forecast) { build(:weather_forecast) }

      it { is_expected.to be_valid }
    end

    describe 'about temp_max' do
      let(:weather_forecast) { build(:weather_forecast, temp_max: nil) }

      it { is_expected.not_to be_valid }
    end

    describe 'about temp_min' do
      let(:weather_forecast) { build(:weather_forecast, temp_min: nil) }

      it { is_expected.not_to be_valid }
    end

    describe 'about weather_id' do
      let(:weather_forecast) { build(:weather_forecast, weather_id: nil) }

      it { is_expected.not_to be_valid }
    end

    describe 'about date' do
      let(:weather_forecast) { build(:weather_forecast, date: nil) }

      it { is_expected.not_to be_valid }
    end

    describe 'about aquired_at' do
      let(:weather_forecast) { build(:weather_forecast, aquired_at: nil) }

      it { is_expected.not_to be_valid }
    end
  end

  describe 'scope' do
    let(:today) { create(:weather_forecast, date: Time.current) }
    let(:tomorrow) { create(:weather_forecast, date: Time.current.tomorrow) }

    it "includes today's weather_forecast" do
      expect(WeatherForecast.today).to include today
    end

    it "includes tomorrow's weather_forecast" do
      expect(WeatherForecast.tomorrow).to include tomorrow
    end
  end

  describe 'weather_condition' do
    let(:weather_forecast) { create(:weather_forecast, weather_id: 200) }

    it 'shows weather_condition' do
      expect(weather_forecast.weather_condition).to eq '雷雨'
    end
  end
end
