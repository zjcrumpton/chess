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
    @board.each do |row|
      row.each { |square| square.piece.nil? ? print(square.color) : print(square.piece.symbol) }
      print "\n"
    end
  end
end
