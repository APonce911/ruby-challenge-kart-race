require_relative 'race'
# The controller class will be responsible for calculating all results
# TODO
# Descobrir o vencedor
# Descobrir a melhor volta de cada piloto
# Descobrir a melhor volta da corrida
# Calcular a velocidade media de cada piloto durante toda corrida
# Descobrir quanto tempo cada piloto chegou apos o vencedor
class Controller
  # initialize(race) takes an instance of the Race as an argument.
  def initialize(race)
    @race = race
  end

  def race_winner
    'airton'
  end
end
