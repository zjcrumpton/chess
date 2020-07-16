# frozen_string_literal: true

require './lib/team.rb'

# represents the white team's pieces and progress
class WhiteTeam < Team
  attr_accessor :start_row, :pawn_row, :queen_square, :king_square
  def initialize(board)
    @board = board
    @start_row = 7
    @pawn_row = 6
    @queen_square = 4
    @king_square = 3
    place_pieces
  end
end
