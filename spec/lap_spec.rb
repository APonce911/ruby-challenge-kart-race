require_relative '../lib/lap'

describe 'Lap', :lap do
  properties = {
    cod: 11,
    pilot: 'S.VETTEL',
    lap_number: 3,
    lap_time: '1:18.097',
    lap_avg_pace: '35,633'
  }
  lap = Lap.new(properties)

  it 'should be initialized with a hash of properties' do
    expect(lap).to be_a(Lap)
  end
  it 'Average pace property is a float' do
    expect(lap.lap_avg_pace).to be_a Float
  end
end

describe 'The method Lap#string_to_seconds:' do
  lap = Lap.new(lap_time: '1:05.345', lap_avg_pace: '35,633')
  it 'Gives a float' do
    expect(lap.lap_time).to be_a Float
  end
  it 'Convert lap time of "1:18.097" to 65.345' do
    expect(lap.lap_time).to eq(65.345)
  end
end
