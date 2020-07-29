FactoryBot.define do
  factory :statistic do
    cities { nil }
    temp_max { 1 }
    temp_min { 1 }
    weather { "MyString" }
    date { "2020-07-29 10:44:52" }
  end
end
