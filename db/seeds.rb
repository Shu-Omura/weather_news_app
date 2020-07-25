require 'csv'

CSV.foreach('db/csv/prefectures.csv') do |row|
  Prefecture.create!(
    name: row[1]
  )
end

osaka = Prefecture.find_by(name: '大阪府')
osaka.cities.create!(
  name: '大阪',
  romaji: 'Osaka',
  location_id: 1853908,
)