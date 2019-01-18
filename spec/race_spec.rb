require 'race'

describe 'The method race_winner:' do
  it 'Is not nil' do
    expect(race_winner).not_to be_nil
  end
  it 'Is not empty' do
    expect(race_winner).not_to eq('')
  end
  it 'Returns a string' do
    expect(race_winner).to be_a String
  end
end

describe 'The method parse_data:' do
  it 'Is not nil' do
    expect(parse_data).not_to be_nil
  end
  it 'Is not empty' do
    expect(parse_data).not_to eq('')
  end
  it 'Returns an array' do
    expect(parse_data).to be_a Array
  end
  it 'Has 23 laps' do
    expect(parse_data.size).to eq(23)
  end
  it 'First element returns a hash' do
    expect(parse_data[0]).to be_a Hash
  end
  it 'First element is not nil' do
    expect(parse_data[0][:hour]).not_to be_nil
  end
  it 'First element is not empty' do
    expect(parse_data[0][:hour]).not_to eq('')
  end
end
