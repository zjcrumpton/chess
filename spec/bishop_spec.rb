require './lib/pieces/bishop.rb'

describe Bishop do
  describe "#move_to" do
    it "can move to any diagonal empty square" do
      game = Chess.new
      game.board.square_at('d5').piece = Bishop.new(game.teams[:white], game.board.square_at('d5'))
      game.board.piece_at('d5').move_to('c6')
      expect(game.board.piece_at('d5').class).to eql(Bishop)
      game.board.piece_at('c6').move_to('b5')
      expect(game.board.piece_at('b5').class).to eql(Bishop)
      game.board.piece_at('b5').move_to('c4')
      expect(game.board.piece_at('c4').class).to eql(Bishop)
      game.board.piece_at('c4').move_to('d5')
      expect(game.board.piece_at('d5').class).to eql(Bishop)
    end
  end
end
