FactoryBot.define do
  factory :weather_forecast do
    temp_max { 1 }
    temp_min { 1 }
    temp_feel { 1 }
    weather_id { 1 }
    railfall { 1 }
    date { "2020-07-25 10:50:11" }
    aquired_at { "2020-07-25 10:50:11" }
  end
end
