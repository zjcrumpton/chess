# frozen_string_literal: true

# represents the entire game of Chess itself
class Chess
  attr_accessor :board
  def initialize
    build_board
  end

  def build_board
    @board = Array.new(8) { Array.new(8) }
  end

  # prints each row of the board out with a new line
  def display_board
    board.each { |row| print "#{row}\n" }
  end
end
