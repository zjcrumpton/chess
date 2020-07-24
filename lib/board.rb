# # frozen_string_literal: true

require 'require_all'
require_relative 'square.rb'
require_all './lib/modules'

# represents the chess board
class Board
  include Display, Find
  attr_accessor :squares
  def initialize
    # creates an 8x8 2d array, each index containing an instance of Square
    @squares = Array.new(8) { Array.new(8) { Square.new } }
    set_locations
    set_edges
  end

  def set_locations
    @squares.each_with_index do |row, i|
      row.each_with_index do |square, j|
        square.row = i
        square.column = j
        square.location = [i, j]
      end
    end
  end


  def set_edges
    @squares.each do |row|
      row.each do |square|
        square.edge = true if square.row == 0 || square.column == 0
      end
    end
  end

  def flip!
    @squares.reverse!
    @squares.each(&:reverse!)
    set_locations
  end
end
