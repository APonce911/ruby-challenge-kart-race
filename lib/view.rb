# the view will define how the information is dispose to the app User
class View
  def print_winner(winner, time)
    # print %x{clear}
    p "the winner is #{winner} on #{time} minutes."
  end
end
