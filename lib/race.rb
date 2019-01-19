require 'csv'
require_relative 'lap'
# this class will be responsable of creating all instances of Lap objects
class Race
  def initialize
    create_lap_instances(parse_data)
  end

  attr_reader :laps

  private

  def parse_data
    laps_parsed = []
    file = './race.csv'
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row.to_sym }
    CSV.foreach(file, csv_options) { |row| laps_parsed << { hour: row['hour'], cod: row['cod'].to_i, pilot: row['pilot'], lap_number: row['lap_number'], lap_time: row['lap_time'], lap_avg_pace: row['lap_avg_pace'] } }
    laps_parsed
  end

  def create_lap_instances(laps_parsed)
    @laps = []
    laps_parsed.each do |lap|
      properties = {hour: lap[:hour], cod: lap[:cod].to_i, pilot: lap[:pilot], lap_number: lap[:lap_number].to_i, lap_time: lap[:lap_time],lap_avg_pace: lap[:lap_avg_pace] }
      @laps << Lap.new(properties)
    end
  end
end
