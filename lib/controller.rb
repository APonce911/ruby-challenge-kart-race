require_relative 'race'
require_relative 'view'

# The controller class will be responsible for calculating all results
# TODO
# Descobrir o vencedor da corrida - DONE
# Descobrir a melhor volta da corrida
# Descobrir a melhor volta de cada piloto
# Calcular a velocidade media de cada piloto durante toda corrida
# Descobrir quanto tempo cada piloto chegou apos o vencedor
class Controller
  # initialize(race) takes an instance of the Race as an argument.
  def initialize(race)
    @race = race
    @view = View.new
  end

  def race_winner
    individual_times
    ranking = generate_ranking[0]
    @view.print_winner(ranking[0], seconds_to_string(ranking[1]))
    ranking
  end

  def best_race_lap
    # lap = @race.laps.sort_by!(&:lap_time)[0]
    lap = sort_by_lap_time(@race.laps)
    @view.print_best_race_lap(lap)
    lap
  end

  private

  def seconds_to_string(seconds)
    mil = ((seconds - seconds.to_i) * 1000).round(0)
    min = (seconds.to_i / 60).round(0)
    sec = (seconds.to_i - min * 60).round(0)
    min.to_s + ':' + (sec < 10 ? '0' : '') + sec.to_s + '.' + mil.to_s
  end

  def individual_times
    @individual_times = {}
    @race.laps.each do |lap|
      if @individual_times.key?(lap.pilot.to_sym)
        @individual_times[lap.pilot.to_sym] << lap.lap_time
      else
        @individual_times[lap.pilot.to_sym] = [lap.lap_time]
      end
    end
  end

  def generate_ranking
    ranking = []
    @individual_times.each do |laps|
      if laps[1].size == 4
        pilot_total_time_array = [laps[0], laps[1].sum.truncate(3)]
        ranking << pilot_total_time_array
      end
    end
    ranking.sort_by! { |pilot_total_time_array| pilot_total_time_array[1] }
  end

  def sort_by_lap_time(laps)
    laps.sort_by!(&:lap_time)[0]
  end
end
