# frozen_string_literal: true

require './lib/team.rb'

# represents the black team's pieces and progress
class BlackTeam < Team
  # defines the unicode symbols for each black piece for display purposes
  @@symbols = {
    pawn: '\u265F',
    rook: '\u265C',
    knight: '\u265E',
    bishop: '\u265D',
    queen: '\u265B',
    king: '\u265A'
  }

  def initialize(board)
    @board = board
    @start_row = 0
    @pawn_row = 1
    @queen_square = 3
    @king_square = 4
    place_pieces
  end
end
