# the view will define how the information is dispose to the app User
class View
  def print_winner(winner, time)
    # print %x{clear}
    puts "The winner is #{winner}. He completed 4 laps on #{time} minutes."
  end

  def print_best_race_lap(lap, time)
    # print %x{clear}
    puts 'The best lap is:'
    puts ''
    puts 'Hour'.ljust(13) + '| Pilot'.ljust(19) + '| Lap number'.ljust(12) + '| Lap time'.ljust(10) + '| Lap avg pace'.ljust(15)
    puts "#{lap.hour}".ljust(13) + "| #{lap.cod}-#{lap.pilot}".ljust(19) + "| #{lap.lap_number}".ljust(12) + "| #{time}".ljust(10) + "| #{lap.lap_avg_pace}".ljust(15)

  end

  def print_race_ranking_table(ranking)
    puts 'Position | Pilot | Laps | Race Time '
    ranking.each_with_index do |pilot, index|
      puts "#{index + 1}        | #{pilot[1][:cod]}-#{pilot[0]} | #{pilot[1][:laps].size} | #{pilot[1][:race_time] }"
    end
  end

  def print_best_pilot_lap(lap, time)
    # print %x{clear}
    puts "The best lap of #{lap.pilot}"
    puts 'Hour'.ljust(13) + '| Pilot'.ljust(19) + '| Lap number'.ljust(12) + '| Lap time'.ljust(10) + '| Lap avg pace'.ljust(15)
    puts "#{lap.hour}".ljust(13) + "| #{lap.cod}-#{lap.pilot}".ljust(19) + "| #{lap.lap_number}".ljust(12) + "| #{time}".ljust(10) + "| #{lap.lap_avg_pace}".ljust(15)
    puts ''
  end

  def print_time_after_first(position, pilot, time_difference)
    # puts 'Position | Pilot       | Race time | Time difference '
    # puts "#{position}        | #{pilot[0]} | #{pilot[1][:race_time]}| #{time_difference}"
    puts "Position: #{position} | Pilot: #{pilot[0]} | Race time: #{pilot[1][:race_time]} | Time difference: #{time_difference}"
  end

  def print_pilot_avg_pace(position, pilot, avg_race_pace)
    puts "Position: #{position} | Pilot: #{pilot[0]} | Average race pace: #{avg_race_pace}"
  end
end
