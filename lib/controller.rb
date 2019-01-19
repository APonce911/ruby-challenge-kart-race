require_relative 'race'
require_relative 'view'

# The controller class will be responsible for calculating all results
# TODO
# Descobrir o vencedor da corrida - DONE
# Descobrir a melhor volta da corrida - DONE
# Descobrir a melhor volta de cada piloto -
# Calcular a velocidade media de cada piloto durante toda corrida
# Descobrir quanto tempo cada piloto chegou apos o vencedor
class Controller
  # initialize(race) takes an instance of the Race as an argument.
  def initialize(race)
    @race = race
    @view = View.new
    individual_times
  end

  def race_winner
    first_place = generate_ranking[0]
    @view.print_winner(first_place[0], seconds_to_string(first_place[1][:race_time]))
    first_place
  end

  def best_race_lap
    lap = sort_by_lap_time(@race.laps)
    @view.print_best_race_lap(lap)
    lap
  end

  def race_ranking_table
    ranking = generate_ranking
    update_race_time(ranking)
    @view.print_race_ranking_table(ranking)
    ranking
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
        @individual_times[lap.pilot.to_sym][:laps] << lap.lap_time
      else
        @individual_times[lap.pilot.to_sym] = { cod: lap.cod, laps: [lap.lap_time] }
      end
    end
  end

  def generate_ranking
    ranking = []
    @individual_times.each do |pilot|
      if pilot[1][:laps].size == 4
        pilot[1][:race_time] = pilot[1][:laps].sum.truncate(3)
        ranking << pilot
      end
    end
    ranking.sort_by! { |array| array[1][:race_time] }
  end

  def sort_by_lap_time(laps)
    laps.sort_by!(&:lap_time)[0]
  end

  def update_race_time(ranking)
    ranking.each do |pilot|
      pilot[1][:race_time] = seconds_to_string(pilot[1][:race_time])
    end
  end
end
