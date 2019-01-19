require_relative '../lib/lap'

describe 'Lap', :lap do
  it 'should be initialized with a hash of properties' do
    properties = { cod: 11, pilot: 'S.VETTEL', lap_number: 3, lap_time: '1:18.097' }
    lap = Lap.new(properties)
    expect(lap).to be_a(Lap)
  end
end

describe 'The method string_to_seconds:' do
  lap = Lap.new(lap_time: '1:05.345')
  it 'Gives a float' do
    expect(lap.lap_time).to be_a Float
  end
  it 'To result in 65.345' do
    expect(lap.lap_time).to eq(65.345)
  end
end
