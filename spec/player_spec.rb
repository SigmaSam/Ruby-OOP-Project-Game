require_relative '../lib/player.rb'

describe Player do
  let(:player1) { Player.new('Mercedes', 'X') }

  it 'has the symbol and name attributes' do
    expect(player1).to have_attributes(name: 'Mercedes', symbol: 'X')
  end

  describe '#score_up' do
    it 'increment score varible by 1' do
      score = player1.score
      expect(player1.score_up).to be(score + 1)
    end
  end

  describe '#array' do
    it 'push a new number into player array' do
      expect(player1.array = 1).to eql(player1.array.length)
    end
  end

  describe '#clear_array' do
    it 'empty array' do
      expect(player1.clear_array).to eql([])
    end
  end
end
