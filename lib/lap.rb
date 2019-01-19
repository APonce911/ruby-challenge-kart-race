# each row of our DB will become an instance of the Lap model
class Lap
  def initialize(attributes = {})
    @cod = attributes[:cod]
    @pilot = attributes[:pilot]
    @lap_number = attributes[:lap_number]
    @lap_time = string_to_seconds(attributes[:lap_time])
  end

  attr_reader :cod, :pilot, :lap_number, :lap_time

  private

  def string_to_seconds(string)
    min_to_sec = (string[0].to_i * 60).truncate(0)
    mil_to_sec = (string[5..7].to_f / 1000).truncate(3)
    seconds = string[2..3].to_f.truncate(0)
    (seconds + mil_to_sec + min_to_sec).truncate(3)
  end
end
