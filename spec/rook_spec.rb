require './lib/pieces/rook.rb'

describe Rook do
  describe "#move_to" do
    it "can move forward to any unobstructed space" do
      game = Chess.new
      game.board.square_at('d4').piece = Rook.new(game.teams[:white], game.board.square_at('d4'))
      game.board.piece_at('d4').move_to('d5')
      expect(game.board.piece_at('d5').class).to eql(Rook)
      game.board.piece_at('d5').move_to('d6')
      expect(game.board.piece_at('d6').class).to eql(Rook)
    end
  end
end
