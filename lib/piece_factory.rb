# frozen_string_literal: true

# factory function for creating pieces
class PieceFactory
  attr_accessor :symbol
  def initialize(symbol)
    @symbol = symbol
  end

  def move; end

  def find_moves
    raise 'abstract method #find_moves must be defined'
  end
end
