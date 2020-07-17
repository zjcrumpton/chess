require './lib/pieces/pawn.rb'

describe Pawn do
  describe "move" do
    it "moves forward one space" do
      game = Chess.new
      game.board[6][0].piece.move(0, 5)
      expect(game.board[5][0].piece.class).to eql(Pawn)
    end
  end

end
