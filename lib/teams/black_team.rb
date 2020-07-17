# frozen_string_literal: true

require './lib/team.rb'

# represents the black team's pieces and progress
class BlackTeam < Team
  # defines the unicode symbols for each black piece for display purposes
  def initialize(board)
    @board = board
    @start_row = 0
    @pawn_row = 1
    @queen_square = 3
    @king_square = 4
    @symbols = {
      pawn: " \u2659 ".encode('utf-8'),
      rook: " \u2656 ".encode('utf-8'),
      knight: " \u2658 ".encode('utf-8'),
      bishop: " \u2657 ".encode('utf-8'),
      queen: " \u2655 ".encode('utf-8'),
      king: " \u2654 ".encode('utf-8')
    }
    place_pieces
  end
end
