namespace :open_weather_api do
  desc 'Requests and save in database'
  task weather_forecasts: :environment do
    City.all.each do |city|
      open_weather = Api::OpenWeatherMap::Request.new(city.location_id)
      # リクエスト上限：60回/min
      response = open_weather.request
      # 3時間ごとのデータ2日分を保存
      16.times do |i|
        params = Api::OpenWeatherMap::Request.attributes_for(response['list'][i])
        if weather_forecast = WeatherForecast.where(city: city, date: params[:date]).presence
          weather_forecast[0].update!(params)
        else
          city.weather_forecasts.create!(params)
        end
      end
    end
    puts 'completed!'
  end
end
