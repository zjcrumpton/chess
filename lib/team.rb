# frozen_string_literal: true

# represents the black team's pieces and progress
class Team
  attr_accessor :start_row, :pawn_row, :queen_square, :king_square
  def initialize(board)
    @board = board
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
    @board[pawn_row].each { |square| square.piece = Pawn.new }
  end

  def place_rooks
    @board[start_row].first.piece = Rook.new
    @board[start_row].last.piece = Rook.new
  end

  def place_knights
    @board[start_row][1].piece = Knight.new
    @board[start_row][6].piece = Knight.new
  end

  def place_bishops
    @board[start_row][2].piece = Bishop.new
    @board[start_row][5].piece = Bishop.new
  end

  def place_queen
    @board[start_row][@queen_square].piece = Queen.new
  end

  def place_king
    @board[start_row][@king_square].piece = King.new
  end
end
