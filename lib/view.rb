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

  def print_race_ranking_table_header
    puts 'Race Ranking'
    puts ''
    puts 'Position'.ljust(10) + '| Pilot'.ljust(19) + '| Laps completed'.ljust(17) + '| Race Time'.ljust(12)
  end

  def print_race_ranking_table(ranking)
    ranking.each_with_index do |pilot, index|
      puts "#{index + 1}".ljust(10) + "| #{pilot[1][:cod]}-#{pilot[0]}".ljust(19) + "| #{pilot[1][:laps].size}".ljust(17) + "| #{pilot[1][:race_time] }".ljust(12)
    end
  end

  def print_best_pilot_lap_header
    puts 'The best laps of each pilot:'
    puts ''
    puts 'Hour'.ljust(13) + '| Pilot'.ljust(19) + '| Lap number'.ljust(12) + '| Lap time'.ljust(10) + '| Lap avg pace'.ljust(15)
  end

  def print_best_pilot_lap(lap, time)
    # print %x{clear}
    puts "#{lap.hour}".ljust(13) + "| #{lap.cod}-#{lap.pilot}".ljust(19) + "| #{lap.lap_number}".ljust(12) + "| #{time}".ljust(10) + "| #{lap.lap_avg_pace}".ljust(15)
  end

  def print_time_after_first(position, pilot, time_difference)
    # puts 'Position | Pilot       | Race time | Time difference '
    # puts "#{position}        | #{pilot[0]} | #{pilot[1][:race_time]}| #{time_difference}"
    puts "Position: #{position} | Pilot: #{pilot[0]} | Race time: #{pilot[1][:race_time]} | Time difference: #{time_difference}"
  end

  def print_pilot_avg_pace_header
    puts 'The average speed of each pilot:'
    puts ''
    puts 'Position'.ljust(10) + '| Pilot'.ljust(19) + '| Average race pace'.ljust(19)
  end

  def print_pilot_avg_pace(position, pilot, avg_race_pace)
    puts "#{position}".ljust(10) + "| #{pilot[0]}".ljust(19) + "| #{avg_race_pace}".ljust(19)
  end
end
