# frozen_string_literal: true
require 'colorize'
require './lib/board.rb'
require 'pry'

# represents the game of Chess
class Chess
  attr_accessor :board
  def initialize
    @board = Board.new.board
  end

  # prints each row of the board out with a new line
  def display_board
    board.each { |row| print "#{row}\n" }
  end
end

