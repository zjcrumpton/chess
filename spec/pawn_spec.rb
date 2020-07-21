require './lib/pieces/pawn.rb'

describe Pawn do
  describe "move" do
    it "moves forward one space" do
      game = Chess.new
      game.board.piece_at('a2').move_to('a3')
      expect(game.board.piece_at('a3').class).to eql(Pawn)
    end

    it "removes pawn from original space" do
      game = Chess.new
      game.board.piece_at('a2').move_to('a3')
      expect(game.board.piece_at('a2').nil?).to eql(true)
    end

    it "is capable of movement after it's first turn" do
      game = Chess.new
      game.board.piece_at('a2').move_to('a3')
      game.board.piece_at('a3').move_to('a4')
      expect(game.board.piece_at('a4').class).to eql(Pawn)
    end

    it "can only make valid moves" do
      game = Chess.new
      game.board.piece_at('a2').move_to('b3')
      expect(game.board.piece_at('b3')).to eql(nil)
    end

    it "can attack enemy pawns diagonally" do
      game = Chess.new
      game.board.square_at('b3').piece = Pawn.new(game.teams[:black].symbols[:pawn], game.teams[:black], game.board.square_at('b3'))
      game.board.piece_at('a2').move_to('b3')
      expect(game.board.piece_at('b3').color).to eql('white')
      game = Chess.new
      game.board.square_at('b3').piece = Pawn.new(game.teams[:black].symbols[:pawn], game.teams[:black], game.board.square_at('b3'))
      game.board.piece_at('c2').move_to('b3')
      expect(game.board.piece_at('b3').color).to eql('white')
    end
  end

end
