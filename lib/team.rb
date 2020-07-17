# frozen_string_literal: true

# represents a team's pieces and progress
class Team
  attr_accessor :start_row, :pawn_row, :queen_square, :king_square, :symbols
  def initialize(board)
    @board = board
    @color = raise 'abstract variable @color must be defined'
    @start_row = raise 'abstract variable @start_row must be defined'
    @pawn_row = raise 'abstract variable @pawn_row must be defined'
    @queen_square = raise 'abstract variable @queen_square must be defined'
    @king_square = raise 'abstract variable @king_square must be defined'
    place_pieces
  end

  def place_pieces
    place_pawns
    place_rooks
    place_knights
    place_bishops
    place_queen
    place_king
  end

  def place_pawns
    @board[pawn_row].each { |square| square.piece = Pawn.new(@symbols[:pawn], @board) }
  end

  def place_rooks
    @board[start_row].first.piece = Rook.new(@symbols[:rook], @board)
    @board[start_row].last.piece = Rook.new(@symbols[:rook], @board)
  end

  def place_knights
    @board[start_row][1].piece = Knight.new(@symbols[:knight], @board)
    @board[start_row][6].piece = Knight.new(@symbols[:knight], @board)
  end

  def place_bishops
    @board[start_row][2].piece = Bishop.new(@symbols[:bishop], @board)
    @board[start_row][5].piece = Bishop.new(@symbols[:bishop], @board)
  end

  def place_queen
    @board[start_row][@queen_square].piece = Queen.new(@symbols[:queen], @board)
  end

  def place_king
    @board[start_row][@king_square].piece = King.new(@symbols[:king], @board)
  end
end
