require_relative '../lib/board.rb'

describe Board do
  let (:board) {Board.new}


  describe "#create_board" do
    it "returns board" do
      expect(board.create_board).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe "#validate_symbol" do
    context "Check if the symbols valid" do
      it "Check if the symbol is 'X' or 'O'" do
        expect(board.validate_symbol('X')).to be(true)
      end
      it "Returns an exception for an invalid input" do
        expect(board.validate_symbol(2)).to be(false)
      end
    end
  end
end