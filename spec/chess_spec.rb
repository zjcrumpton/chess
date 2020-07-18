require './lib/chess.rb'

describe Chess do
  describe "#initialize" do
    it "creates an 8x8 board" do
      game = Chess.new
      expect(game.board.squares.all? {|row| row.length == 8}).to eql(true)
    end

    it "fills the board with Squares" do
      game = Chess.new
      expect(game.board.squares.all? {|row| row.all? {|i| i.class == Square}}).to eql(true)
    end

    it "fills the pawn rows with pawns" do 
      game = Chess.new
      expect(game.board.squares[1].all? {|i| i.piece.class == Pawn}).to eql(true)
      expect(game.board.squares[6].all? {|i| i.piece.class == Pawn}).to eql(true)
    end

    it "fills rook spaces with rooks" do
      game = Chess.new
      expect(game.board.squares[0][0].piece.class).to eql(Rook)
      expect(game.board.squares[0][7].piece.class).to eql(Rook)
      expect(game.board.squares[7][0].piece.class).to eql(Rook)
      expect(game.board.squares[7][7].piece.class).to eql(Rook)
    end

    it "fills knight spaces with knights" do
      game = Chess.new
      expect(game.board.squares[0][1].piece.class).to eql(Knight)
      expect(game.board.squares[0][6].piece.class).to eql(Knight)
      expect(game.board.squares[7][1].piece.class).to eql(Knight)
      expect(game.board.squares[7][6].piece.class).to eql(Knight)
    end

    it "fills bishop spaces with bishops" do
      game = Chess.new
      expect(game.board.squares[0][2].piece.class).to eql(Bishop)
      expect(game.board.squares[0][5].piece.class).to eql(Bishop)
      expect(game.board.squares[7][2].piece.class).to eql(Bishop)
      expect(game.board.squares[7][5].piece.class).to eql(Bishop)
    end

    it "fills queen spaces with queens" do
      game = Chess.new
      expect(game.board.squares[0][3].piece.class).to eql(Queen)
      expect(game.board.squares[7][3].piece.class).to eql(Queen)
    end

    it "fills king spaces with kings" do
      game = Chess.new
      expect(game.board.squares[0][4].piece.class).to eql(King)
      expect(game.board.squares[7][4].piece.class).to eql(King)
    end

    it "doesn't place any pieces in the middle of the board" do
      game = Chess.new
      expect(game.board.squares[2].all? {|row| row.piece.nil? }).to eql(true)
      expect(game.board.squares[3].all? {|row| row.piece.nil? }).to eql(true)
      expect(game.board.squares[4].all? {|row| row.piece.nil? }).to eql(true)
      expect(game.board.squares[5].all? {|row| row.piece.nil? }).to eql(true)
    end
  end
end


