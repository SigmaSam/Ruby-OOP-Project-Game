require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
describe Board do
  let(:board) { Board.new }
  let(:player1) { Player.new('Mercedes', 'X') }
  let(:array_win) { [1, 2, 3] }
  let(:array_loser) { [1, 3, 7] }
  let(:arr_player) {}

  describe '#create_board' do
    it 'returns board' do
      expect(board.create_board).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#validate_symbol' do
    context 'Check if the symbols valid' do
      it "Check if the symbol is 'X' or 'O'" do
        expect(board.validate_symbol('X')).to be(true)
      end
      it 'Returns an exception for an invalid input' do
        expect(board.validate_symbol(2)).to be(false)
      end
    end
  end

  describe '#validate_turn' do
    context 'Check if position is valid' do
      it 'return false is position is out of boundaries' do
        board.create_board
        expect(board.validate_turn(11)).to be(false)
      end
      it 'return false if position is alredy taken' do
        board.create_board
        board.place_symbol(1, player1)
        expect(board.validate_turn(1)).to be(false)
      end
    end
  end

  describe '#place_symbol' do
    context 'Check if selected position is changed' do
      it 'returns board changed' do
        board.create_board
        expect(board.place_symbol(1, player1)).to eql(['X', 2, 3, 4, 5, 6, 7, 8, 9])
      end
    end
  end

  describe '#check_win' do
    it 'Returns true when there is a winner' do
      expect(board.check_win(array_win)).to be(true)
    end

    it 'Returns true when there is not a winner' do
      expect(board.check_win(array_loser)).to be(false)
    end
  end

  describe '#winner?' do
    it 'returns true if a player wins' do
      (1..3).each do |i|
        player1.array = i
      end
      expect(board.winner?(player1)).to be(true)
    end

    it 'returns false if a player loses' do
      (2..4).each do |i|
        player1.array = i
      end
      expect(board.winner?(player1)).to be(false)
    end
  end
end
