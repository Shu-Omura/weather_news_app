namespace :open_weather_api do
  desc 'Requests and save in database'
  task weather_forecasts: :environment do
    uri = Rails.application.credentials.open_weather[:uri]

    # リクエスト上限：60回/min
    City.all.each do |city|
      query = { id: city.location_id, units: 'metric', appid: Rails.application.credentials.open_weather[:appid] }

      client = HTTPClient.new
      request = client.get(uri, query) # 戻り値は3時間ごとのデータ5日分
      response = JSON.parse(request.body)

      # 3時間ごとのデータ2日分を保存
      16.times do |i|
        attrs = response['list'][i]

        rainfall = attrs['rain']['3h'] if attrs['rain']
        date = attrs['dt_txt'].in_time_zone('UTC').in_time_zone

        params = {
          temp_max:   attrs['main']['temp_max'],
          temp_min:   attrs['main']['temp_min'],
          temp_feel:  attrs['main']['feels_like'],
          weather_id: attrs['weather'][0]['id'],
          rainfall:   rainfall,
          date:       date,
        }

        if weather_forecast = WeatherForecast.where(city: city, date: date).presence
          weather_forecast[0].update!(params)
        else
          city.weather_forecasts.create!(params)
        end
      end
    end
  end
end
