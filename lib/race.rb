require 'csv'
require_relative 'lap'
# this class will be responsable of creating all instances of Lap objects
class Race
  def initialize
    # @laps = []
    parse_data
  end

  attr_reader :laps

  def race_winner
    'airton'
  end

  private

  def parse_data
    @laps = []
    file = './race.csv'
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row.to_sym }
    CSV.foreach(file, csv_options) { |row| @laps << { hour: row['hour'], cod: row['cod'].to_i, pilot: row['pilot'], lap_number: row['lap_number'], lap_time: row['lap_time'], lap_avg_time: row['lap_avg_time'] } }
    @laps
    # add_lap(@laps)
  end

  # def add_lap
  #   p @laps.class

  # end
end

# r = Race.new
