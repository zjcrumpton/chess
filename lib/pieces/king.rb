# frozen_string_literal: true

require './lib/piece_factory.rb'

# represents the king piece in chess
class King < PieceFactory
  attr_accessor :castles

  def find_moves
    @moves = []
    @castles = []
    add_moves_for('up')
    add_moves_for('left')
    add_moves_for('right')
    add_moves_for('down')
    add_moves_for('ul_diag')
    add_moves_for('ur_diag')
    add_moves_for('dl_diag')
    add_moves_for('dr_diag')
    add_moves_for('castle_left') if @team.class == WhiteTeam && @move_count == 0 && @team.current_team?
    remove_checks
  end

  def moves_for(direction)
    next_move_for(direction)
    return if @move.nil?

    if direction == 'castle_left'
      castle_left
    else
      add_check
      if @move.piece.nil?
        @moves << @move
      else
        @moves << @move unless @move.piece.team == @team
      end
    end
  end

  def castle_left
    @moves << @move if between_clear?
    @castles << @move
  end

  def between_clear?
    current = @rook_square
    i = 0
    until i == 3
      i += 1
      current = @board.squares[@square.row][i]
      if current.piece.nil? == false || current.check?
        return false
      end
    end
    return true
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
