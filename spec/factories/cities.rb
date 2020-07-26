FactoryBot.define do
  factory :city do
    name { '大阪' }
    romaji { 'Osaka' }
    location_id { '123' }
    prefecture
  end
end
