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
      game.board.display
      game.board.display_checks
      game.board.piece_at('e1').move_to('e2')
      game.board.piece_at('e2').move_to('e3')
      game.board.piece_at('e3').move_to('e4')
      game.board.piece_at('e4').show_moves
      game.board.piece_at('e4').move_to('e5')
      expect(game.board.piece_at('e5').class).to eql(King)
      game.board.piece_at('e5').show_moves
    end

    it "can't move into spaces under attack (check)" do
      game = Chess.new
      game.board.square_at('e5').piece = Bishop.new(game.teams[:black], game.board.square_at('e5'))
      game.board.square_at('e4').piece = King.new(game.teams[:white], game.board.square_at('e4'))
      expect(game.board.piece_at('f4').nil?).to eql(true)
    end
  end
end
