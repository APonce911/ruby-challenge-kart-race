require 'race'

describe 'The method race_winner:' do
  it 'Is not nil' do
    expect(race_winner).not_to be_nil
  end

  it 'Returns a string' do
    expect(race_winner).to be_a String
  end

end
