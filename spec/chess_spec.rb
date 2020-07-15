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
  end
end
