# the router will be responsible for communicating the command
# line with the APP controller
class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    # print %x{clear}
    puts 'welcome to the Kart race challenge APP!'
    puts '           --           '

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.race_winner
    when 2 then @controller.best_race_lap
    when 3 then @controller.race_ranking_table
    when 4 then @controller.best_pilot_lap
    when 5 then @controller.time_after_first
    when 6 then @controller.pilot_avg_pace
    when 99 then stop
    else
      puts 'Please press 1, 2 or 99'
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ''
    puts '----------------------------------------------------------------------'
    puts 'What would you like to know about the race?'
    puts '1  - Race winner info'
    puts '2  - Best lap on race'
    puts '3  - Ranking table'
    puts '4  - Best laps by pilot'
    puts '5  - Time difference table (pilot x winner)'
    puts '6  - Average race pace per pilot'
    puts '99 - stop'
  end
end
