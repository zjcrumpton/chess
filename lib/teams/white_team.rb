# frozen_string_literal: true

require './lib/team.rb'

# represents the white team's pieces and progress
class WhiteTeam < Team
  # defines the unicode symbols for each white piece for display purposes

  def initialize(board)
    @board = board
    @start_row = 7
    @pawn_row = 6
    @queen_square = 4
    @king_square = 3

    @symbols = {
      pawn: " \u265F ".encode('utf-8'),
      rook: " \u265C ".encode('utf-8'),
      knight: " \u265E ".encode('utf-8'),
      bishop: " \u265D ".encode('utf-8'),
      queen: " \u265B ".encode('utf-8'),
      king: " \u265A ".encode('utf-8')
    }

    place_pieces
  end
end
