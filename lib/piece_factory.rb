# frozen_string_literal: true

# factory function for creating pieces
class PieceFactory
  attr_accessor :moves, :symbol, :board
  def initialize(symbol, board)
    @symbol = symbol
    @board = board
    @moves = []
  end

  def move; end

  def find_moves
    raise 'abstract method #find_moves must be defined'
  end
end
