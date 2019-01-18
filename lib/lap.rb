# each row of our DB will become an instance of the Lap model
class Lap
  def initialize(attributes = {})
    @cod = attributes[:cod]
    @pilot = attributes[:pilot]
    @lap_number = attributes[:lap_number]
    @lap_time = attributes[:lap_time]
  end

  attr_reader :cod, :pilot, :lap_number, :lap_time
end
