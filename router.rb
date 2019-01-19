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
    # when 2 then @controller
    # when 3 then @controller
    # when 4 then @controller
    when 99 then stop
    else
      puts 'Please press 1 or 99'
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ''
    puts 'What do you want to do next?'
    puts '1  - Race winner info'
    puts '99 - stop'
  end
end
