require 'csv'
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
      properties = { cod: lap[:cod], pilot: lap[:pilot], lap_number: lap[:lap_number], lap_time: lap[:lap_time] }
      @laps << Lap.new(properties)
      # p "ihull"
    end
    @laps
  end
end

# r = Race.new
