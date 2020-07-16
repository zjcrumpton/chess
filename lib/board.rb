# frozen_string_literal: true

# represents the chess board
class Board
  attr_accessor :board
  def initialize
    white_space = "\u2B1C"
    @board = Array.new(8) { Array.new(8) }
  end
end
