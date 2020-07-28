# frozen_string_literal: true

require './lib/team.rb'

# represents the black team's pieces and progress
class BlackTeam < Team
  attr_accessor :color, :board, :captured, :current_team
  # defines the unicode symbols for each black piece for display purposes
  def initialize(board, current_team = false)
    @board = board
    @start_row = @board.squares[7]
    @pawn_row = @board.squares[6]
    @queen_square = 4
    @king_square = 3
    @color = 'black'
    @symbols = {
      Pawn: " \u2659 ".encode('utf-8'),
      Rook: " \u2656 ".encode('utf-8'),
      Knight: " \u2658 ".encode('utf-8'),
      Bishop: " \u2657 ".encode('utf-8'),
      Queen: " \u2655 ".encode('utf-8'),
      King: " \u2654 ".encode('utf-8')
    }
    @current_team = current_team
    place_pieces
    @captured = []
  end
end
