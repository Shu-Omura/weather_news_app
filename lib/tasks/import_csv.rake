require 'csv'

namespace :import_csv do
  desc 'Import prefectures'
  task prefectures: :environment do
    list = []
    CSV.foreach('db/csv/prefectures.csv') do |row|
      list << {
        name: row[1],
      }
    end

    puts 'start creating prefectures'
    begin
      Prefecture.create!(list)
      puts 'completed!'
    rescue ActiveModel::UnknownAttributeError
      puts 'raised error: unknown attributes'
    end
  end

  desc 'Import cities'
  task cities: [:environment, :prefectures] do
    list = []
    prefs = []
    CSV.foreach('db/csv/cities.csv') do |row|
      prefs << Prefecture.find_by(name: row[0])
      list << {
        name: row[1],
        romaji: row[2].capitalize,
        location_id: row[3],
      }
    end

    puts 'start creating cities'
    begin
      prefs.each_with_index { |pref, i| pref.cities.create!(list[i]) }
      puts 'completed!'
    rescue ActiveModel::UnknownAttributeError
      puts 'raised error: unknown attributes'
    end
  end
end
