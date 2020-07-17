# frozen_string_literal: true

require 'require_all'
require 'pry'
require_relative 'square.rb'
require_all './lib/teams'
require_all './lib/pieces'

# represents the chess board
class Board
  attr_accessor :board
  def initialize
    # creates an 8x8 2d array, each index containing an instance of Square
    @board = Array.new(8) { Array.new(8) { Square.new } }
  end

  def print_board
    print "  a  b  c  d  e  f  g  h \n"
    row_num = 8
    @board.each do |row|
      print row_num
      row.each { |square| square.piece.nil? ? print(square.color) : print(square.piece.symbol) }
      print row_num
      print "\n"
      row_num -= 1
    end
    print "  a  b  c  d  e  f  g  h \n"
  end
end
