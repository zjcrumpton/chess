require './lib/pieces/queen.rb'

describe Queen do
  describe "#move_to" do
    it "can move to any unobstructed empty square" do
      game = Chess.new
      game.board.square_at('d5').piece = Queen.new(game.teams[:white], game.board.square_at('d5'))
      game.board.piece_at('d5').move_to('c6')
      expect(game.board.piece_at('c6').class).to eql(Queen)
      game.board.piece_at('c6').move_to('b5')
      expect(game.board.piece_at('b5').class).to eql(Queen)
      game.board.piece_at('b5').move_to('c4')
      expect(game.board.piece_at('c4').class).to eql(Queen)
      game.board.piece_at('c4').move_to('d5')
      expect(game.board.piece_at('d5').class).to eql(Queen)
      game = Chess.new
      game.board.square_at('e4').piece = Queen.new(game.teams[:white], game.board.square_at('e4'))
      game.board.piece_at('e4').move_to('e5')
      expect(game.board.piece_at('e5').class).to eql(Queen)
      game.board.piece_at('e5').move_to('e6')
      expect(game.board.piece_at('e6').class).to eql(Queen)
      game.board.piece_at('e6').move_to('d6')
      expect(game.board.piece_at('d6').class).to eql(Queen)
      game.board.piece_at('d6').move_to('e6')
      expect(game.board.piece_at('e6').class).to eql(Queen)
      game.board.piece_at('e6').move_to('e5')
      expect(game.board.piece_at('e5').class).to eql(Queen)
    end

    it "can capture enemy pieces" do
      game = Chess.new
      game.board.square_at('d5').piece = Queen.new(game.teams[:white], game.board.square_at('d5'))
      game.board.piece_at('d5').move_to('b7')
      expect(game.board.piece_at('b7').class).to eql(Queen)
    end
  end
end
