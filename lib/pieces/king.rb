# frozen_string_literal: true

require './lib/piece_factory.rb'

# represents the king piece in chess
class King < PieceFactory
  def find_moves
    @moves = []
    add_moves_for('up')
    add_moves_for('left')
    add_moves_for('right')
    add_moves_for('down')
    add_moves_for('ul_diag')
    add_moves_for('ur_diag')
    add_moves_for('dl_diag')
    add_moves_for('dr_diag')
    remove_checks
  end

  def moves_for(direction)
    next_move_for(direction)
    return if @move.nil?
    add_check

    if @move.piece.nil?
      @moves << @move
    else
      @moves << @move unless @move.piece.team == @team
    end
  end

  def remove_checks
    @moves = @moves.filter { |move| move.check == false}
  end

  def pawn_check
    @board.squares.each do |row|
      row.each do |square|

      end
    end
  end

  def show_checks
    @moves.each do |move|
      puts "#{move.location} Check?: #{move.check?}"
    end
  end
end
