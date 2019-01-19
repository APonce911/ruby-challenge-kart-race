require_relative '../lib/race'

describe 'Race', :race do
  it 'should be initialized without defining properties' do
    race = Race.new
    expect(race).to be_a(Race)
  end
end

describe 'The method parse_data:' do
  race = Race.new
  it 'Is not nil' do
    expect(race.send(:parse_data)).not_to be_nil
  end
  it 'Is not empty' do
    expect(race.send(:parse_data)).not_to eq('')
  end
  it 'Returns an array' do
    expect(race.send(:parse_data)).to be_a Array
  end
  it 'Has 23 laps' do
    expect(race.send(:parse_data).size).to eq(23)
  end
  it 'First element returns a hash' do
    expect(race.send(:parse_data)[0]).to be_a Hash
  end
  it 'First element is not nil' do
    expect(race.send(:parse_data)[0][:hour]).not_to be_nil
  end
  it 'First element is not empty' do
    expect(race.send(:parse_data)[0][:hour]).not_to eq('')
  end
end

describe 'The method laps' do
  race = Race.new
  it 'Is not nil' do
    expect(race.laps).not_to be_nil
  end
  it 'Is not empty' do
    expect(race.laps).not_to eq('')
  end
  it 'Returns an array' do
    expect(race.laps).to be_a Array
  end
  it 'Has 23 laps' do
    expect(race.laps.size).to eq(23)
  end
  it 'First element returns a Lap instance' do
    expect(race.laps[0]).to be_a(Lap)
  end
  it 'First element is not nil' do
    expect(race.laps[0].cod).not_to be_nil
  end
  it 'First element is not empty' do
    expect(race.laps[0].cod).not_to eq('')
  end
end
