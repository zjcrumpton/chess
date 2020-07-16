# frozen_string_literal: true
require './lib/square.rb'

# represents the chess board
class Board
  attr_accessor :board
  def initialize
    white_space = "\u2B1C"
    @board = Array.new(8) { Array.new(8) { Square.new } }
  end
end


