# frozen_string_literal: true

require 'colorize'
require './lib/modules/visualizer.rb'

# factory function for creating pieces
class PieceFactory
  include MoveVisuals
  attr_accessor :moves, :symbol, :team, :square, :move_count, :left, :right
  def initialize(team, square)
    @symbol = team.symbols[self.class.to_s.to_sym]
    @team = team
    @board = team.board
    @square = square
    @left = @board.squares[@square.row][@square.column - 1]
    @right = @board.squares[@square.row][@square.column + 1]
    @moves = []
    @move_count = 0
    find_moves
  end

  def move_to(destination)
    find_moves
    return unless @moves.include?(@board.square_at(destination))

    remove_pieces(@board.square_at(destination))
    new_piece = self.class.new(team, @board.square_at(destination))
    new_piece.move_count = move_count + 1
    @board.square_at(destination).piece = new_piece
  end

  def remove_pieces(destination)
    capture(destination)
    @square.piece = nil
  end

  def capture(destination)
    @team.captured << destination.piece unless destination.piece.nil?
    capture_en_passant(destination) unless @en_passants.nil?
    destination.piece = nil
  end

  def capture_en_passant(destination)
    if @en_passants.include?(destination)
      en_passant_piece = @board.squares[destination.row + 1][destination.column]
      @team.captured << en_passant_piece.piece
      en_passant_piece.piece = nil
    end
  end

  def show_captured
    print 'Captured: '
    @team.captured.each do |piece|
      piece.symbol = piece.symbol.colorize(background: :black)
      puts piece.symbol
    end
  end
end
