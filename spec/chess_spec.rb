require './lib/chess.rb'

describe Chess do
  describe "#initialize" do
    it "creates an 8x8 board" do
      game = Chess.new
      expect(game.board.length).to eql(8)
      expect(game.board[0].length).to eql(8)
      expect(game.board[1].length).to eql(8)
      expect(game.board[2].length).to eql(8)
      expect(game.board[3].length).to eql(8)
      expect(game.board[4].length).to eql(8)
      expect(game.board[5].length).to eql(8)
      expect(game.board[6].length).to eql(8)
      expect(game.board[7].length).to eql(8)
      expect(game.board[8].nil?).to eql(true)
    end

    it "fills the board with Squares" do
      game = Chess.new

      expect(game.board.each {|row| row.all? {|i| i.class == Square}})
    end

    it "fills the pawn rows" do 
      game = Chess.new

      expect(game.board[7].any? {|i| i == nil}).to eql(false)
      expect(game.board[1].any? {|i| i == nil}).to eql(false)
    end

    it "fills the pawn rows with only pawns" do 
      game = Chess.new

      expect(game.board[7].all? {|i| i.class == Pawn}).to eql(false)
      expect(game.board[7].all? {|i| i.class == Pawn}).to eql(false)
    end
  end
end


# Public API
  #move_piece
  #

  # on setup, pawn rows should be full, and it should be full of the same type of thing

