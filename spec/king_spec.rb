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
      game.board.square_at('e4').piece = King.new(game.teams[:white], game.board.square_at('e4'))
      game.board.square_at('e5').piece = Pawn.new(game.teams[:black], game.board.square_at('e5'))
      game.board.piece_at('e4').move_to('e5')
      expect(game.board.piece_at('e5').class).to eql(King)
    end

    it "can't move into spaces under attack (check)" do
      game = Chess.new
      game.board.square_at('e5').piece = Bishop.new(game.teams[:black], game.board.square_at('e5'))
      game.board.square_at('e4').piece = King.new(game.teams[:white], game.board.square_at('e4'))
      # game.board.flip!
      # game.board.piece_at('d5').flip_moves!
      # game.board.flip!

      game.board.piece_at('b7').move_to('b5')
      game.board.piece_at('e4').show_moves
      game.board.display_checks
      game.board.piece_at('e4').move_to('e5')
      game.board.display
      # game.board.piece_at('e4').flip_moves!
      # game.board.display_checks
      # game.board.piece_at('e4').move_to('f4')
      # expect(game.board.piece_at('f4').nil?).to eql(true)
    end
  end
end
