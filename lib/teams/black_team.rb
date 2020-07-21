# frozen_string_literal: true

require './lib/team.rb'

# represents the black team's pieces and progress
class BlackTeam < Team
  attr_reader :color, :board, :captured
  # defines the unicode symbols for each black piece for display purposes
  def initialize(board)
    @board = board
    @start_row = @board.squares[7]
    @pawn_row = @board.squares[6]
    @queen_square = 3
    @king_square = 4
    @color = 'black'
    @symbols = {
      pawn: " \u2659 ".encode('utf-8'),
      rook: " \u2656 ".encode('utf-8'),
      knight: " \u2658 ".encode('utf-8'),
      bishop: " \u2657 ".encode('utf-8'),
      queen: " \u2655 ".encode('utf-8'),
      king: " \u2654 ".encode('utf-8')
    }
    place_pieces
    @captured = []
    @board.flip!
  end
end
