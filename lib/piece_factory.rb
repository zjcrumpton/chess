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
    with_back
  end

  def move_to(destination)
    find_moves
    return if !@moves.include?(convert(@board, destination))
    
    remove_pieces(@board.square_at(destination))
    @board.square_at(destination).piece = self.class.new(@symbol, team, convert(@board, destination))
  end

  def remove_pieces(destination)
    destination.piece = nil
    @square.piece = nil
  end

  def with_back
    if @square.back == 'black'
      @symbol = symbol.colorize(:background => :blue)
    else
      @symbol = symbol.colorize(:background => :green)
    end 
  end
end
