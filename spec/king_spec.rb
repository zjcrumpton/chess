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
      game.board.square_at('e5').piece = Pawn.new(game.teams[:black], game.board.square_at('e5'))
      game.board.square_at('e4').piece = King.new(game.teams[:white], game.board.square_at('e4'))
      game.board.piece_at('e4').show_moves
      game.board.piece_at('e4').move_to('f4')
      expect(game.board.piece_at('f4').class.nil?).to eql(true)
    end
  end
end
