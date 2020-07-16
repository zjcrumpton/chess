require './lib/chess.rb'

describe Chess do
  describe "#initialize" do
    it "creates an 8x8 board" do
      game = Chess.new
      expect(game.board.all? {|row| row.length == 8}).to eql(true)
    end

    it "fills the board with Squares" do
      game = Chess.new
      expect(game.board.all? {|row| row.all? {|i| i.class == Square}}).to eql(true)
    end

    it "fills the pawn rows with pawns" do 
      game = Chess.new
      expect(game.board[1].all? {|i| i.piece.class == Pawn}).to eql(false)
      expect(game.board[7].all? {|i| i.class == Pawn}).to eql(false)
    end
  end
end


# Public API
  #move_piece
  #

  # on setup, pawn rows should be full, and it should be full of the same type of thing

