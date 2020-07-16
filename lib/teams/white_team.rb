# frozen_string_literal: true

require './lib/team.rb'

# represents the white team's pieces and progress
class WhiteTeam < Team
  # defines the unicode symbols for each white piece for display purposes
  @@symbols = {
    pawn: '\u2659',
    rook: '\u2656',
    knight: '\u2658',
    bishop: '\u2657',
    queen: '\u2655',
    king: '\u2654'
  }

  def initialize(board)
    @board = board
    @start_row = 7
    @pawn_row = 6
    @queen_square = 4
    @king_square = 3
    place_pieces
  end
end
