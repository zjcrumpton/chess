# frozen_string_literal: true

require './lib/team.rb'
require 'colorize'

# represents the white team's pieces and progress
class WhiteTeam < Team
  attr_accessor :color, :board, :captured, :current_team
  # defines the unicode symbols for each white piece for display purposes
  def initialize(board, current_team = false)
    @board = board
    @start_row = @board.squares[7]
    @pawn_row = @board.squares[6]
    @queen_square = 3
    @king_square = 4
    @color = 'white'
    @symbols = {
      Pawn: " \u265F ".encode('utf-8'),
      Rook: " \u265C ".encode('utf-8'),
      Knight: " \u265E ".encode('utf-8'),
      Bishop: " \u265D ".encode('utf-8'),
      Queen: " \u265B ".encode('utf-8'),
      King: " \u265A ".encode('utf-8')
    }
    @captured = []
    @current_team = current_team
    place_pieces
  end
end
