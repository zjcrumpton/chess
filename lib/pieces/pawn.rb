# frozen_string_literal: true

require './lib/piece_factory.rb'
require 'pry'

# represents the pawn piece in chess
class Pawn < PieceFactory
  attr_accessor :en_passants

  def find_moves
    @moves = []
    @en_passants = []
    @team.current_team? ? add_my_moves : add_enemy_moves
  end

  def moves_for(direction)
    next_move_for(direction)
    return if @move.nil?

    if @moves.empty?
      forward_moves
    elsif direction == 'double_up' || direction == 'double_down'
      @moves << @move if @move.piece.nil?
    elsif @move.piece.nil? == false
      add_check
      add_attacks
    else
      add_check
      en_passant if @square.row == 3
    end
  end

  def forward_moves
    @moves << @move if @move.piece.nil?
    double_move?
  end
  
  def add_attacks
    @moves << @move unless @move.piece.team == @team
  end

  def double_move?
    if @square.row == 6
      moves_for('double_up') if @move.piece.nil?
    elsif @square.row == 1
      moves_for('double_down') if @move.piece.nil?
    end
  end

  def en_passant
    find_below
    return if @below.piece.nil? || @below.piece.team == @team

    add_passant if @below.piece.class == Pawn
  end

  def find_below
    @below = if @team.current_team?
               @board.squares[@move.row + 1][@move.column]
             else
               @board.squares[@move.row - 1][@move.column]
             end
  end

  def add_passant
    return if below.piece.move_count < 1

    @moves << @move
    @en_passants << @move
  end

  def add_my_moves
    add_moves_for('up')
    add_moves_for('ul_diag')
    add_moves_for('ur_diag')
  end

  def add_enemy_moves
    add_moves_for('down')
    add_moves_for('dl_diag')
    add_moves_for('dr_diag')
  end

  def promote(class_name)
    return if class_name == Pawn || @square.row.zero? == false

    @square.piece = class_name.new(@team, @square)
  end
end
