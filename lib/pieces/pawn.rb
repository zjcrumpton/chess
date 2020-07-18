# frozen_string_literal: true

require './lib/piece_factory.rb'
require 'pry'

# represents the pawn piece in chess
class Pawn < PieceFactory
  def find_moves
    # @board
  end

  def move(column, row)
    remove_piece(self)
    @board[row][column].piece = Pawn.new(@symbol, @board)
  end
end
