require 'csv'
require_relative 'lap'
# this class will be responsable of creating all instances of Lap objects
class Race
  def initialize
    parse_data
    create_lap_instances
  end

  attr_reader :laps

  def race_winner
    'airton'
  end

  def laps
    @laps
  end

  private

  def parse_data
    @laps_parsed = []
    file = './race.csv'
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row.to_sym }
    CSV.foreach(file, csv_options) { |row| @laps_parsed << { hour: row['hour'], cod: row['cod'].to_i, pilot: row['pilot'], lap_number: row['lap_number'], lap_time: row['lap_time'], lap_avg_time: row['lap_avg_time'] } }
    @laps_parsed
  end

  def create_lap_instances
    @laps = []
    @laps_parsed.each do |lap|
      # seconds = string_to_seconds(lap[:lap_time])
      properties = { cod: lap[:cod].to_i, pilot: lap[:pilot], lap_number: lap[:lap_number].to_i, lap_time: lap[:lap_time] }
      @laps << Lap.new(properties)
    end
  end
end

# r = Race.new
