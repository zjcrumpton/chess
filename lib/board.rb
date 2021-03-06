# frozen_string_literal: true

# # frozen_string_literal: true

require 'require_all'
require_relative 'square.rb'
require_all './lib/modules'

# represents the chess board
class Board
  include Find
  include Display
  attr_accessor :squares, :current_team
  def initialize
    # creates an 8x8 2d array, each index containing an instance of Square
    @squares = Array.new(8) { Array.new(8) { Square.new } }
    set_locations
    set_edges
    @current_team = WhiteTeam
  end

  def refind_moves
    reset_checks
    @squares.each do |row|
      row.each do |square|
        square.piece.find_moves unless square.piece.nil?
      end
    end
  end

  def reset_checks
    @squares.each do |row|
      row.each do |square|
      square.check = false
      end
    end
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
    if @current_team == WhiteTeam
      @current_team = BlackTeam
    else
      @current_team = WhiteTeam 
    end
    refind_moves
  end
end
