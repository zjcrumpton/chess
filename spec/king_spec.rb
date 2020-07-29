require './lib/pieces/king.rb'

describe King do
  describe "#move_to" do
    it "can move to one unobstructed space in any direction" do
      game = Chess.new
      game.board.square_at('e4').piece = King.new(game.teams[:white], game.board.square_at('e4'))
      game.board.piece_at('e4').move_to('d5')
      expect(game.board.piece_at('d5').class).to eql(King)
      game.board.piece_at('d5').move_to('c5')
      expect(game.board.piece_at('c5').class).to eql(King)
    end

    it "can capture enemy pieces" do
      game = Chess.new
      game.board.square_at('e2').piece = nil
      game.board.piece_at('e7').move_to('e5')
      game.board.piece_at('e1').move_to('e2')
      game.board.piece_at('e2').move_to('e3')
      game.board.piece_at('e3').move_to('e4')
      game.board.piece_at('e4').move_to('e5')
      expect(game.board.piece_at('e5').class).to eql(King)
    end

    it "can't move into spaces under attack (check)" do
      game = Chess.new
      game.board.square_at('e5').piece = Bishop.new(game.teams[:black], game.board.square_at('e5'))
      game.board.square_at('e4').piece = King.new(game.teams[:white], game.board.square_at('e4'))
      game.board.piece_at('e4').move_to ('f4')
      expect(game.board.piece_at('f4').nil?).to eql(true)
    end

    it "can castle with the left rook" do
      game = Chess.new
      game.board.piece_at('b1').move_to('a3')
      game.board.piece_at('b2').move_to('b4')
      game.board.piece_at('c2').move_to('c4')
      game.board.piece_at('d1').move_to('c2')
      game.board.piece_at('c1').move_to('b2')

      game.board.display
      game.board.piece_at('e1').show_moves
      game.board.piece_at('e1').move_to('c1')
      expect(game.board.piece_at('c1').class).to eql(King)
      game.board.display
      expect(game.board.piece_at('d1').class).to eql(Rook)
     
    end
  end
end
