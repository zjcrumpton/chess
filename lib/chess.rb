# frozen_string_literal: true

require 'require_all'
require './lib/board.rb'
require 'pry'
require_all './lib/teams'

# represents the game of Chess
class Chess
  attr_accessor :board, :teams
  def initialize
    @board = Board.new.board
    @teams = [WhiteTeam.new(@board), BlackTeam.new(@board)]
  end

  # prints each row of the board out with a new line - not tested because it's a graphics related method
  # def display_board
  #   @board.each do |row|
  #     row.each { |square| print "#{square.piece.nil? ? 'nil' : square.piece}  " }
  #     print "\n"
  #   end
  # end
end

game = Chess.new
binding.pry
