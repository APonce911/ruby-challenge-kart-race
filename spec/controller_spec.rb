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

describe 'The method seconds_to_string:' do
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
end
