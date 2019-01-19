#the view will define how the information is dispose to the app User
class View

  def print_winner(ranking)
    p "the winner #{ranking[0][0].to_s} on #{seconds_to_string(ranking[0][1])} minutes."
  end

end
