# frozen_string_literal: true

require 'colorize'
require './lib/modules/visualizer.rb'
require './lib/modules/movement.rb'

# factory function for creating pieces
class PieceFactory
  include MoveList
  include MoveVisuals
  attr_accessor :moves, :symbol, :team, :square, :move_count
  def initialize(team, square)
    @symbol = team.symbols[self.class.to_s.to_sym]
    @team = team
    @board = team.board
    @square = square
    @move_count = 0
    find_moves
  end

  def move_to(destination)
    @board.refind_moves
    return unless @moves.include?(@board.square_at(destination))
    remove_pieces(@board.square_at(destination))
    new_piece = self.class.new(team, @board.square_at(destination))
    new_piece.move_count = move_count + 1
    @board.square_at(destination).piece = new_piece
    @board.refind_moves
    @check = false if self.class == King
  end

  def remove_pieces(destination)
    capture(destination)
    @square.piece = nil
    return unless self.class == King
    return unless @castles.include?(destination)
    @rook_square.piece = nil
    @rook_move.piece = Rook.new(@team, @rook_move)
  end

  def capture(destination)
    @team.captured << destination.piece unless destination.piece.nil?
    capture_en_passant(destination) unless @en_passants.nil?
    destination.piece = nil
  end

  def capture_en_passant(destination)
    return unless @en_passants.include?(destination)

    en_passant_piece = @board.squares[destination.row + 1][destination.column]
    @team.captured << en_passant_piece.piece
    en_passant_piece.piece = nil
  end

  def add_moves_for(direction)
    @i = 0
    moves_for(direction)
  end

  def moves_for(direction)
    next_move_for(direction)

    return if @move.nil?

    add_check unless @team.current_team == true

    if @move.piece.nil?
      @moves << @move
      moves_for(direction) unless @move.edge?
    else
      @moves << @move unless @move.piece.team == @team
    end
  end

  def add_check
    return if @team.class == @board.current_team

    @move.check = true
  end
end
