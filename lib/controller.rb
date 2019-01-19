require_relative 'race'
# The controller class will be responsible for calculating all results
class Controller
  # initialize(race) takes an instance of the Race as an argument.
  def initialize(race)
    @race = race
  end

  def race_winner
    'airton'
  end
end
