# frozen_string_literal: true

# factory function for creating pieces
class PieceFactory
  attr_accessor :moves, :symbol, :team, :square, :color
  def initialize(symbol, team, square)
    @symbol = symbol
    @team = team
    @color = team.color
    @square = square
    @moves = []
    find_moves
  end

  def move; end

  def find_moves
    raise 'abstract method #find_moves must be defined'
  end

  def remove_piece
    @square.piece = nil
  end
end
