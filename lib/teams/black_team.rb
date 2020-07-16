# frozen_string_literal: true

require './lib/team.rb'

# represents the black team's pieces and progress
class BlackTeam < Team
  attr_accessor :start_row, :pawn_row, :queen_square, :king_square
  def initialize(board)
    @board = board
    @start_row = 0
    @pawn_row = 1
    @queen_square = 3
    @king_square = 4
    place_pieces
  end
end
