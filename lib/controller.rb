require_relative 'race'
# The controller class will be responsible for calculating all results
# TODO
# Descobrir o vencedor da corrida
# Descobrir a melhor volta de cada piloto
# Descobrir a melhor volta da corrida
# Calcular a velocidade media de cada piloto durante toda corrida
# Descobrir quanto tempo cada piloto chegou apos o vencedor
class Controller
  # initialize(race) takes an instance of the Race as an argument.
  def initialize(race)
    @race = race
  end

  def race_winner
    individual_times = {}
    @race.laps.each do |lap|
      if individual_times.key?(lap.pilot.to_sym)
        individual_times[lap.pilot.to_sym] << lap.lap_time
      else
        individual_times[lap.pilot.to_sym] = [lap.lap_time]
      end
    end
    p individual_times
    ranking = []
    individual_times.each do |laps|
      if laps[1].size == 4
        pilot_total_time_array = [laps[0], laps[1].sum.truncate(3)]
        ranking << pilot_total_time_array
      end
    end
    ranking.sort_by! { |pilot_total_time_array| pilot_total_time_array[1] }
    p ranking
    p winner = ranking[0][0].to_s
    p winner_time = ranking[0][1]
    'airton'
  end

  private

  # def seconds_to_string(seconds)
  #   seconds.trunc
  #   min = seconds/60
  #   sec =
  #   mil =
  # end

end
