require './lib/pieces/pawn.rb'

describe Pawn do
  describe "move" do
    it "moves forward one space" do
      game = Chess.new
      game.piece_at('a2').move_to('a3')
      expect(game.piece_at('a3').class).to eql(Pawn)
    end

    it "removes pawn from original space" do
      game = Chess.new
      game.piece_at('a2').move_to('a3')
      expect(game.piece_at('a2').nil?).to eql(true)
    end

    it "can only make valid moves" do
      game = Chess.new
      game.piece_at('a2').move_to('b3')
      expect(game.piece_at('b3')).to eql(nil)
    end
  end

end
