FactoryBot.define do
  factory :statistic do
    temp_max { 20 }
    temp_min { 10 }
    weather_d {  '晴れ' }
    weather_n {  '晴れ' }
    date { Date.today }
    city
  end
end
