# frozen_string_literal: true

require './lib/piece_factory.rb'
require 'pry'

# represents the pawn piece in chess
class Pawn < PieceFactory
  attr_accessor :en_passants

  def find_moves
    @moves = []
    @en_passants = []
    if @team.current_team?
      add_moves_for('up')
      add_moves_for('ul_diag')
      add_moves_for('ur_diag')
    else
      add_moves_for('down')
      add_moves_for('dl_diag')
      add_moves_for('dr_diag')
    end
  end

  def moves_for(direction)
    next_move_for(direction)
    return if @move.nil?

    if @moves.empty? 
      @moves << @move if @move.piece.nil?
      if @team.current_team == true
        if @square.row == 6
          moves_for('double_up') if @move.piece.nil?
        end
      else
        if @square.row == 1
          moves_for('double_down') if @move.piece.nil?
        end
      end
    elsif direction == 'double_up' && @move.piece.nil?
      @moves << @move
    elsif direction == 'double_down' && @move.piece.nil?
      @moves << @move
    elsif @move.piece.nil? == false
      add_check
      @moves << @move unless @move.piece.team == @team
    else
      add_check
      return unless @square.row == 3
      below = @board.squares[@move.row + 1][@move.column] if @team.current_team == true
      below = @board.squares[@move.row - 1][@move.column] if @team.current_team == false

      if below.piece.nil? == false && below.piece.team != @team && below.piece.class == Pawn
        return if below.piece.move_count > 1
        @moves << @move
        @en_passants << @move 
      end
    end
  end

  def promote(class_name)
    return if class_name == Pawn || @square.row.zero? == false

    @square.piece = class_name.new(@team, @square)
  end
end
