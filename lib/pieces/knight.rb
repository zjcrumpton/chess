# frozen_string_literal: true
require './lib/piece_factory.rb'

# represents the knight piece in chess
class Knight < PieceFactory
  include KnightMoves
  def find_moves
    @moves = []
    add_moves_for('up_left')
    add_moves_for('left_up')
    add_moves_for('left_down')
    add_moves_for('down_left')
    add_moves_for('down_right')
    add_moves_for('right_down')
    add_moves_for('right_up')
    add_moves_for('up_right')
  end

  def moves_for(direction)
    next_move_for(direction)
    return if @move.nil?

    if @move.piece.nil?
      @moves << @move
    else
      @moves << @move unless @move.piece.team == @team
    end
  end
end
