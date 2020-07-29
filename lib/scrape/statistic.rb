require 'open-uri'
require 'nokogiri'
require 'csv'
require 'active_support/core_ext'

uri = URI('http://www.data.jma.go.jp/obd/stats/etrn/view/daily_s1.php')
charset = nil
list_data = [%w(city year month day temp_max temp_min weather_d weather_n)]

CSV.foreach('db/csv/city_no.csv', headers: true) do |row|
  2017.upto(2019) do |year|
    1.upto(12) do |month|
      uri.query = { prec_no: row[1],
                    block_no: row[2],
                    year: year,
                    month: month,
                    view: 's1',
                  }.to_query

      html = open(uri.to_s) do |f|
        charset = f.charset
        f.read
      end
  
      doc = Nokogiri::HTML.parse(html, nil, charset)

      doc.xpath('//tr[position()>4]').each_with_index do |node, index|
        day = index + 1
        temp_max = node.xpath('td[8]').text
        temp_min = node.xpath('td[9]').text
        weather_d = node.xpath('td[20]').text
        weather_n = node.xpath('td[21]').text
        list_data << [row[0], year, month, day, temp_max, temp_min, weather_d, weather_n]
      end

      CSV.open('db/csv/statistic.csv', 'w') do |csv|
        list_data.each do |data|
          csv << data
        end
      end  
      sleep(10)
    end
  end
end
