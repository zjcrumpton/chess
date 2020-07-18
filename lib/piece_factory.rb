# frozen_string_literal: true

require_relative 'conv_notation.rb'

# factory function for creating pieces
class PieceFactory
  include ConvNotation
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

  def move(square)
    convert(@board, square).piece = self.class.new(@symbol, team, square)
    remove_piece
  end

  def remove_piece
    @square.piece = nil
  end
end
