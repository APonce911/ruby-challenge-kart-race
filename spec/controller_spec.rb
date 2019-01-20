require_relative '../lib/controller'

describe 'Controller', :controller do
  let(:race) { Race.new }

  it 'should be initialized with a `Race` instance' do
    controller = Controller.new(race)
    expect(controller).to be_a(Controller)
  end
end

describe 'The method Controller#race_winner:' do
  let(:race) { Race.new }
  let(:controller) { Controller.new(race) }

  it 'Is not nil' do
    expect(controller.race_winner).not_to be_nil
  end
  it 'Is not empty' do
    expect(controller.race_winner).not_to eq('')
  end
  it 'Returns an Array' do
    expect(controller.race_winner).to be_a Array
  end
end

describe 'The method Controller#seconds_to_string:' do
  let(:race) { Race.new }
  let(:controller) { Controller.new(race) }

  it 'Is not nil' do
    expect(controller.send(:seconds_to_string, 65.345)).not_to be_nil
  end
  it 'Is not empty' do
    expect(controller.send(:seconds_to_string, 65.345)).not_to eq('')
  end
  it 'Returns a string' do
    expect(controller.send(:seconds_to_string, 65.345)).to be_a String
  end
  it "Returns '1:05.345' with 65.345 seconds" do
    expect(controller.send(:seconds_to_string, 65.345)).to eq('1:05.345')
  end
  it "Returns '1:03.745' with 63.745 seconds" do
    expect(controller.send(:seconds_to_string, 63.745)).to eq('1:03.745')
  end
  it "Returns '3:11.221' with 191.221 seconds" do
    expect(controller.send(:seconds_to_string, 191.221)).to eq('3:11.221')
  end
end

describe 'The method Controller#best_race_lap' do
  let(:race) { Race.new }
  let(:controller) { Controller.new(race) }
  it 'Returns a Lap instance' do
    expect(controller.best_race_lap).to be_a(Lap)
  end
  it 'Hour attribute is a String ' do
    expect(controller.best_race_lap.hour).to be_a String
  end
  it 'Pilot attribute is a String ' do
    expect(controller.best_race_lap.pilot).to be_a String
  end
  it 'Lap_avg_pace attribute is a String ' do
    expect(controller.best_race_lap.lap_avg_pace).to be_a String
  end
  it 'Lap_time attribute is a String ' do
    expect(controller.best_race_lap.lap_time).to be_a Float
  end
  it 'Cod attribute is an Integer ' do
    expect(controller.best_race_lap.cod).to be_a Integer
  end
  it 'Lap_number attribute is an Integer ' do
    expect(controller.best_race_lap.lap_number).to be_a Integer
  end
end

describe 'The method Controller#race_ranking_table:' do
  let(:race) { Race.new }
  let(:controller) { Controller.new(race) }

  it 'Is not nil' do
    expect(controller.race_ranking_table).not_to be_nil
  end
  it 'Is not empty' do
    expect(controller.race_ranking_table).not_to eq('')
  end
  it 'Returns an Array' do
    expect(controller.race_ranking_table).to be_a Array
  end
  it 'Has nested Arrays' do
    expect(controller.race_ranking_table[0]).to be_a Array
  end
  it 'Has pilot symbol on index 0' do
    expect(controller.race_ranking_table[0][0]).to be_a Symbol
  end
  it 'Has pilot race data as Hash on index 1' do
    expect(controller.race_ranking_table[0][1]).to be_a Hash
  end
end

describe 'The method Controller#best_pilot_lap:' do
  let(:race) { Race.new }
  let(:controller) { Controller.new(race) }

  it 'Is not nil' do
    expect(controller.best_pilot_lap).not_to be_nil
  end
  it 'Is not empty' do
    expect(controller.best_pilot_lap).not_to eq('')
  end
  it 'Returns a Hash' do
    expect(controller.best_pilot_lap).to be_a Hash
    # expect(lap).to be_a(Lap)
  end
end

describe 'The method Controller#time_after_first:' do
  let(:race) { Race.new }
  let(:controller) { Controller.new(race) }

  it 'Is not nil' do
    expect(controller.time_after_first).not_to be_nil
  end
  it 'Is not empty' do
    expect(controller.time_after_first).not_to eq('')
  end
  it 'Returns a Lap instance' do
    expect(controller.time_after_first).to be_a Hash
    # expect(lap).to be_a(Lap)
  end
end
