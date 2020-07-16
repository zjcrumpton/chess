# frozen_string_literal: true

require 'require_all'
require 'pry'
require './lib/square.rb'
require_all './lib/teams'
require_all './lib/pieces'

# represents the chess board
class Board
  attr_accessor :board
  def initialize
    white_space = "\u2B1C"
    # creates an 8x8 2d array, each index containing an instance of Square
    @board = Array.new(8) { Array.new(8) { Square.new } }
  end

  def display
    @board.each do |row|
      row.each { |square| print "#{square.piece.nil? ? 'nil' : square.piece}  " }
      print "\n"
    end
  end
end
