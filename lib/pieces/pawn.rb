# frozen_string_literal: true

require './lib/piece_factory.rb'
require 'pry'

# represents the pawn piece in chess
class Pawn < PieceFactory
  attr_accessor :en_passants, :double, :forward

  def find_moves
    @moves = []
    @forward = nil
    @double = nil
    @en_passants = []
    add_moves_for('up')
    add_moves_for('ul_diag')
    add_moves_for('ur_diag')
  end

  def moves_for(direction)
    next_move_for(direction)
    return if @move.nil?

    if @moves.empty? 
      @moves << @move if @move.piece.nil?
      @forward = @board.squares[switch(@move.location[0] - 1)][@move.location[1]]
      moves_for('double_up') if @square.row == 6
    elsif direction == 'double_up' && @move.piece.nil?
      @double = @board.squares[switch(@move.location[0] - 2)][@move.location[1]]
      @moves << @move
    elsif @move.piece.nil? == false
      @moves << @move unless @move.piece.team == @team
    else
      return unless @square.row == 3
      below = @board.squares[@move.row + 1][@move.column]
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

#TODO - Include Pawns in check calculations
