require_relative '../lib/controller'

describe 'Controller', :controller do
  let(:race) { Race.new }

  it 'should be initialized with a `Race` instance' do
    controller = Controller.new(race)
    expect(controller).to be_a(Controller)
  end
end

describe 'The method race_winner:' do
  let(:race) { Race.new }
  let(:controller) { Controller.new(race) }

  it 'Is not nil' do
    expect(controller.race_winner).not_to be_nil
  end
  it 'Is not empty' do
    expect(controller.race_winner).not_to eq('')
  end
  it 'Returns a string' do
    expect(controller.race_winner).to be_a String
  end
end
