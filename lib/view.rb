# the view will define how the information is dispose to the app User
class View
  def print_winner(winner, time)
    # print %x{clear}
    puts "The winner is #{winner}. He completed 4 laps on #{time} minutes."
  end

  def print_best_race_lap(lap)
    # print %x{clear}
    puts 'The best lap is'
    puts ''
    # puts "Hour: #{lap.hour}; Pilot: #{lap.cod}-#{lap.pilot}; Lap Number: #{lap.lap_number}; Lap Time: #{lap.lap_time}; Lap avg pace: #{lap.lap_avg_pace};"
    puts "Hour         | Pilot          | Lap Number| Lap Time| Lap avg pace"
    puts "#{lap.hour} | #{lap.cod}-#{lap.pilot} | #{lap.lap_number}         | #{lap.lap_time}  | #{lap.lap_avg_pace}"
  end

  def print_race_ranking_table(ranking)
    puts "Position | Pilot | Laps | Race Time "
    ranking.each_with_index do |pilot, index|
      puts "#{index+1}        | #{pilot[1][:cod]}-#{pilot[0].to_s} | #{pilot[1][:laps].size} | #{pilot[1][:race_time] }"
    end
  end
end
