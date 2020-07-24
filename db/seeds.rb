Prefecture.create!(
  name: "大阪府",
)
Prefecture.first.cities.create!(
  name: "大阪",
  romaji: "Osaka",
  city_id: 1853908,
)