require 'csv'

namespace :import_csv do
  desc 'Import all csv'
  task import_prefecture_city_statistic: :environment do
    Rake::Task['import_csv:prefectures'].execute
    Rake::Task['import_csv:cities'].execute
    Rake::Task['import_csv:statistic'].execute
    Rake::Task['import_csv:statistic_2'].execute
  end
  
  desc 'Import prefectures'
  task prefectures: :environment do
    list = []
    CSV.foreach('db/csv/prefectures.csv') do |row|
      list << { name: row[1] }
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
  task cities: [:environment] do
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

  desc 'Import statistic'
  task statistic: :environment do
    list = []
    cities = []
    CSV.foreach('db/csv/statistic.csv', headers: true) do |row|
      cities << City.find_by(name: row[0])
      list << {
        temp_max: row[4],
        temp_min: row[5],
        weather_d: row[6],
        weather_n: row[7],
        date: Time.zone.local(row[1], row[2], row[3]),
      }
    end

    puts 'start creating statistics'
    begin
      cities.each_with_index { |city, i| city.statistics.create!(list[i]) }
      puts 'completed!'
    rescue ActiveModel::UnknownAttributeError
      puts 'raised error: unknown attributes'
    end
  end

  desc 'Import statistic in different format'
  task statistic_2: :environment do
    list = []
    cities = []
    CSV.foreach('db/csv/statistic_2.csv', headers: true) do |row|
      cities << City.find_by(name: row[0])
      list << {
        temp_max: row[4],
        temp_min: row[5],
        date: Time.zone.local(row[1], row[2], row[3]),
      }
    end

    puts 'start creating statistics'
    begin
      cities.each_with_index { |city, i| city.statistics.create!(list[i]) }
      puts 'completed!'
    rescue ActiveModel::UnknownAttributeError
      puts 'raised error: unknown attributes'
    end
  end
end
