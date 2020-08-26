require_relative '../lib/player.rb'

describe Player do
  let(:player1) { Player.new('Mercedes', 'X') }
  let(:player2) { Player.new('Juan', 'O') }

  describe '#initialize' do
    it 'has the symbol and name attributes' do
      expect(player1).to have_attributes(name: 'Mercedes', symbol: 'X')
    end
    it 'raise an error if input information is no valid or missing' do
      expect(player2).to_not have_attributes(name: Integer, symbol: '')
    end
  end

  describe '#score_up' do
    it 'increment score varible by 1' do
      score = player1.score
      expect(player1.score_up).to be(score + 1)
    end
  end

  describe '#array' do
    context 'array in being changed when' do
      it ' a new number is given to player array' do
        expect(player1.array = 1).to eql(player1.array.length)
      end
      it 'does not change if argument is invalid or taken' do
        expect(player2.array = 'x').to_not eql(player2.array.length)
      end
    end
  end

  describe '#clear_array' do
    it 'empty array' do
      expect(player1.clear_array).to eql([])
    end
  end
end
