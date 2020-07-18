# frozen_string_literal: true
require_relative 'conv_notation.rb'

# factory function for creating pieces
class PieceFactory
  attr_accessor :moves, :symbol, :team, :square, :color
  def initialize(symbol, team, square)
    @symbol = symbol
    @team = team
    @board = team.board
    @color = team.color
    @square = square
    @moves = []
    find_moves
  end

  def find_moves
    raise 'abstract method #find_moves must be defined'
  end

  def move(column, row)
    remove_piece
    @board.squares[row][column].piece = Pawn.new(@symbol, self.team, self.square)
  end

  def remove_piece
    @square.piece = nil
  end
end
