require './lib/pieces/knight.rb'

describe Knight do
  describe "#move_to" do
    it "can move in an L pattern" do
      game = Chess.new
      game.board.square_at('e4').piece = Knight.new(game.teams[:white], game.board.square_at('e4'))
      game.board.piece_at('e4').move_to('d6')
      expect(game.board.piece_at('d6').class).to eql(Knight)
      game.board.piece_at('d6').move_to('b5')
      expect(game.board.piece_at('b5').class).to eql(Knight)
    end

    it "can capture enemy pieces" do
      game = Chess.new
      game.board.square_at('e4').piece = Knight.new(game.teams[:white], game.board.square_at('e4'))
      game.board.piece_at('e4').move_to('d6')
      game.board.piece_at('d6').move_to('b5')
      game.board.piece_at('b5').move_to('c7')
      expect(game.board.piece_at('c7').class).to eql(Knight)
    end
  end
end
