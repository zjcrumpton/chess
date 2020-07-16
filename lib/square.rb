# frozen_string_literal: true

# represents one space on a chess board
class Square
  attr_accessor :piece
  def initialize
    @piece = nil
  end
end
