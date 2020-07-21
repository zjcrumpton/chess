# frozen_string_literal: true

require 'colorize'
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
    return unless @moves.include?(convert(@board, destination))

    remove_pieces(@board.square_at(destination))
    @board.square_at(destination).piece = self.class.new(@symbol, team, @board.square_at(destination))
  end

  def remove_pieces(destination)
    capture(destination)
    destination.piece = nil
    @square.piece = nil
  end

  def capture(destination)
    @team.captured << destination.piece unless destination.piece.nil?
  end

  def show_captured
    print 'Captured: '
    @team.captured.each do |piece|
      piece.symbol = piece.symbol.colorize(background: :black)
      puts piece.symbol
    end
  end

  def with_back
    @symbol = if @square.back == 'black'
                symbol.colorize(background: :blue)
              else
                symbol.colorize(background: :green)
              end
  end
end
