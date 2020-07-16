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
    place_pawns(6)
    place_rooks(0)
    place_rooks(7)
    place_knights(0)
    place_knights(7)
    place_bishops(0)
    place_bishops(7)
    place_queen(0, 3)
    place_queen(7, 4)
  end

  def place_pawns(row)
    @board[row].each { |square| square.piece = Pawn.new }
  end

  def place_rooks(row)
    @board[row].first.piece = Rook.new
    @board[row].last.piece = Rook.new
  end

  def place_knights(row)
    @board[row][1].piece = Knight.new
    @board[row][6].piece = Knight.new
  end

  def place_bishops(row)
    @board[row][2].piece = Bishop.new
    @board[row][5].piece = Bishop.new
  end

  def place_queen(row, square)
    @board[row][square].piece = Queen.new
  end
end


