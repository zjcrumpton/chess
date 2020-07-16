# frozen_string_literal: true
require './lib/square.rb'
require 'require_all'
require_all './lib/pieces'
require 'pry'

# represents the chess board
class Board
  attr_accessor :board
  def initialize
    white_space = "\u2B1C"
    # creates an 8x8 2d array, each index containing an instance of Square
    @board = Array.new(8) { Array.new(8) { Square.new } }
    place_pieces
    @board
  end

  def place_pieces
    place_pawns(1)
    place_pawns(7)
  end

  def place_pawns(row)
    @board[row].each { |square| square.piece = Pawn.new }
  end
end


