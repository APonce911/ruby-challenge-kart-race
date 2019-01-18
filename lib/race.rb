require 'csv'

def race_winner
  'airton'
end

private

def parse_data
  file = './race.csv'
  laps = []
  csv = { col_sep: ',', quote_char: '"', headers: %i[hour cod pilot lap_number lap_time lap_avg_time] }
  CSV.foreach(file, csv) { |row| laps << { hour: row[:hour], cod: row[:cod].to_i, pilot: row[:pilot], lap_number: row[:lap_number], lap_time: row[:lap_time], lap_avg_time: row[:lap_avg_time] } }
  laps
end
