# frozen_string_literal: true

# factory function for creating pieces
class PieceFactory
  def move

  end

  def find_moves
    raise "abstract method #find_moves must be defined"
  end
end
