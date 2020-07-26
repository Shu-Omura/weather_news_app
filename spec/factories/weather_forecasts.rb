FactoryBot.define do
  factory :weather_forecast do
    temp_max { 1 }
    temp_min { 1 }
    temp_feel { 1 }
    weather_id { 802 }
    rainfall { 1 }
    date { Time.current }
    aquired_at { Time.current }

    trait :tomorrow do
      date { Time.current.tomorrow }
    end

    trait :increment_date do
      sequence(:date) { |i| Time.current.beginning_of_day.since((i * 3).hours) }
    end
  end
end
