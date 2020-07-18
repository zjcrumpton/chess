# frozen_string_literal: true

require 'require_all'
require_relative 'board.rb'
require_relative 'conv_notation.rb'
require 'pry'
require_all './lib/teams'

# represents the game of Chess
class Chess
  include ConvNotation
  attr_accessor :board, :teams, :display
  def initialize
    @board = Board.new
    @teams = { white: WhiteTeam.new(@board) }
    @board.flip!
    @teams[:black] = BlackTeam.new(@board)
  end
end

chess = Chess.new
chess.board.display


