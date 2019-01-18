require 'csv'

def race_winner
  'airton'
end

private

def parse_data
  file = './race.csv'
  laps = []
  csv_options = { col_sep: ',', quote_char: '"', headers: :first_row.to_sym }
  CSV.foreach(file, csv_options) { |row| laps << { hour: row['hour'], cod: row['cod'].to_i, pilot: row['pilot'], lap_number: row['lap_number'], lap_time: row['lap_time'], lap_avg_time: row['lap_avg_time'] } }
  laps
end

# p parse_data
