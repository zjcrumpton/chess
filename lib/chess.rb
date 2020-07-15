# frozen_string_literal: true

# represents the entire game of Chess itself
class Chess
  attr_accessor :board
  def initialize
    @board = Array.new(8) {Array.new(8)}
  end

end
