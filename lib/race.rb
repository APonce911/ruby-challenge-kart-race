require 'csv'
require 'time'
require_relative 'lap'
# this class will be responsable of creating all instances of Lap objects
class Race
  def initialize
    # @laps = []
    parse_data
    create_lap_instances
  end

  attr_reader :laps

  def race_winner
    'airton'
  end


  private

  def parse_data
    @laps_hash = []
    file = './race.csv'
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row.to_sym }
    CSV.foreach(file, csv_options) { |row| @laps_hash << { hour: row['hour'], cod: row['cod'].to_i, pilot: row['pilot'], lap_number: row['lap_number'], lap_time: row['lap_time'], lap_avg_time: row['lap_avg_time'] } }
    @laps_hash
  end

  def create_lap_instances
    @laps = []
    @laps_hash.each do |lap|
      seconds = string_to_seconds(lap[:lap_time])
      properties = { cod: lap[:cod].to_i, pilot: lap[:pilot], lap_number: lap[:lap_number].to_i, lap_time: seconds }
      @laps << Lap.new(properties)
    end
  end

  def string_to_seconds(string)
    min_to_sec = string[0].to_i * 60
    mil_to_sec = string[5..7].to_f / 1000
    string[2..3].to_f + mil_to_sec + min_to_sec
  end
end

r = Race.new
p r.string_to_seconds('1:03.987')

