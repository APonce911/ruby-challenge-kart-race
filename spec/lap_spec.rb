require_relative '../lib/lap'

describe 'Lap', :lap do
  it 'should be initialized with a hash of properties' do
    properties = { cod: 11, pilot: 'S.VETTEL', lap_number: 3, lap_time: '1:18.097' }
    lap = Lap.new(properties)
    expect(lap).to be_a(Lap)
  end
end
