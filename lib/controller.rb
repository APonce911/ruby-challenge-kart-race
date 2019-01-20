require_relative 'race'
require_relative 'view'

# The controller class will be responsible for calculating all results
# TODO
# Descobrir o vencedor da corrida - DONE
# Descobrir a melhor volta da corrida - DONE
# Tabela de rankings - DONE
# Descobrir a melhor volta de cada piloto - DONE
# Descobrir quanto tempo cada piloto chegou apos o vencedor DONE
# Calcular a velocidade media de cada piloto durante toda corrida DONE
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
    time = seconds_to_string(lap.lap_time)
    @view.print_best_race_lap(lap, time)
    lap
  end

  def race_ranking_table
    @view.print_race_ranking_table_header
    ranking = generate_ranking
    ranking << @incomplete.flatten
    update_race_time(ranking)
    @view.print_race_ranking_table(ranking)
    ranking
  end

  def best_pilot_lap
    @view.print_best_pilot_lap_header
    @individual_times.each do |pilot|
      pilot_laps = @race.laps.select { |x| x.pilot == pilot[0].to_s }
      lap = sort_by_lap_time(pilot_laps)
      time = seconds_to_string(lap.lap_time)
      # time = lap.lap_time
      @view.print_best_pilot_lap(lap, time)
    end
  end

  def time_after_first
    ranking = generate_ranking
    winner_race_time = ranking[0][1][:race_time]
    ranking.each_with_index do |pilot, index|
      position = index + 1
      time_difference =  (pilot[1][:race_time] - winner_race_time).round(3)
      @view.print_time_after_first(position, pilot, time_difference)
    end
  end

  def pilot_avg_pace
    @view.print_pilot_avg_pace_header
    ranking = generate_ranking
    ranking.each_with_index do |pilot, index|
      position = index + 1
      avg_race_pace = (pilot[1][:laps_avg_pace].sum / pilot[1][:laps_avg_pace].size).round(3)
      @view.print_pilot_avg_pace(position, pilot, avg_race_pace)
    end
  end

  private

  def seconds_to_string(seconds)
    mil = ((seconds - seconds.to_i) * 1000).round(0)
    min = (seconds.to_i / 60).round(0)
    sec = (seconds.to_i - min * 60).round(0)
    min.to_s + ':' + (sec < 10 ? '0' : '') + sec.to_s + '.' + (mil < 100 ? '0' : '') + mil.to_s
  end

  def individual_times
    @individual_times = {}
    @race.laps.each do |lap|
      if @individual_times.key?(lap.pilot.to_sym)
        @individual_times[lap.pilot.to_sym][:laps] << lap.lap_time
        @individual_times[lap.pilot.to_sym][:laps_avg_pace] << lap.lap_avg_pace
      else
        @individual_times[lap.pilot.to_sym] = { cod: lap.cod, laps: [lap.lap_time], laps_avg_pace: [lap.lap_avg_pace] }
      end
    end
  end

  def generate_ranking
    ranking = []
    @incomplete = []
    @individual_times.each do |pilot|
      pilot[1][:race_time] = pilot[1][:laps].sum.truncate(3)
      if pilot[1][:laps].size == 4
        ranking << pilot
      else
        @incomplete << pilot
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
