require 'csv'

CSV.foreach('db/csv/prefectures.csv') do |row|
  Prefecture.create!(
    name: row[1]
  )
end

CSV.foreach('db/csv/cities.csv') do |row|
  pref = Prefecture.find_by(name: row[0])
  pref.cities.create!(
    name: row[1],
    romaji: row[2].capitalize,
    location_id: row[3],
  )
end
