# weather_news_app

全国各地の天気と、過去3年分の気象情報が一度にわかるお天気アプリ。

# DEMO
![demo_2](https://github.com/Shu-Omura/weather_news_app/blob/images/public/demo_3.png)
![demo](https://github.com/Shu-Omura/weather_news_app/blob/images/public/demo.png)

# Features

過去3年分の気象情報も同時に閲覧可能です。天気予報の信頼性をあげることができます。
去年、一昨年はどんな天気だったのか、全て同じ天気ならより安心して信用できるようにしました。

# Requirement
* ruby 2.7.1
* rails 6.0.3

# Usage
```bash
git clone https://github.com/Shu-Omura/weather_news_app.git
cd weather_news_app
docker-compose up --build
```
初期データの書き込み
```ruby
bin/rake import_csv:import_prefecture_city_statistic
```
以下、[OpenWeatherMap](https://openweathermap.org/)にてAPI KEYの取得が必要です。
```ruby
bin/rake open_weather_api:weather_forecasts
```

# Author
* Shu Omura
* ohs6261@gmail.com

# License
[MIT license](https://en.wikipedia.org/wiki/MIT_License)
