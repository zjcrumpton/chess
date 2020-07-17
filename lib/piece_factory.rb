# frozen_string_literal: true

# factory function for creating pieces
class PieceFactory
  attr_accessor :moves, :symbol, :board, :square
  def initialize(symbol, board)
    @symbol = symbol
    @board = board
    @square
    @moves = []
  end

  def move; end

  def find_moves
    raise 'abstract method #find_moves must be defined'
  end
  
  def remove_piece(piece)
    @board.each { |row| row.each { |square| (square.piece = nil if square.piece == piece) }}
  end
end
