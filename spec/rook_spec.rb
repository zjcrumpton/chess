require './lib/pieces/rook.rb'

describe Rook do
  describe "#move_to" do
    it "can move to any non-diagonal empty square" do
      game = Chess.new
      game.board.square_at('e4').piece = Rook.new(game.teams[:white], game.board.square_at('e4'))
      game.board.piece_at('e4').move_to('e5')
      expect(game.board.piece_at('e5').class).to eql(Rook)
      game.board.piece_at('e5').move_to('e6')
      expect(game.board.piece_at('e6').class).to eql(Rook)
      game.board.piece_at('e6').move_to('d6')
      expect(game.board.piece_at('d6').class).to eql(Rook)
      game.board.piece_at('d6').move_to('e6')
      expect(game.board.piece_at('e6').class).to eql(Rook)
      game.board.piece_at('e6').move_to('e5')
      expect(game.board.piece_at('e5').class).to eql(Rook)
    end

    it "can capture enemy pieces" do
      game = Chess.new
      game.board.square_at('d6').piece = Rook.new(game.teams[:white], game.board.square_at('d6'))
      game.board.piece_at('d6').move_to('d7')
      expect(game.board.piece_at('d7').class).to eql(Rook)
      game.board.piece_at('d7').move_to('c7')
      expect(game.board.piece_at('c7').class).to eql(Rook)
    end

    #TODO - add castling test once king is functional
    # it "can castle" do
    #   game = Chess.new
    #   # game.board.display
    #   game.board.remove_at('b1')
    #   game.board.remove_at('c1')
    #   game.board.remove_at('d1')
    #   game.board.piece_at('a1').show_moves

    # end
  end
end
