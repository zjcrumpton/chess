# frozen_string_literal: true

require './lib/piece_factory.rb'
require 'pry'

# represents the pawn piece in chess
class Pawn < PieceFactory
  attr_accessor :en_passants, :double, :anti_forward

  def find_moves
    @moves = []
    add_moves_for('up')
    add_moves_for('ul_diag')
    add_moves_for('ur_diag')
  end

  def moves_for(direction)
    next_move_for(direction)
    return if @move.nil?

    if @moves.empty? 
      @moves << @move if @move.piece.nil?
      moves_for('double_up') if @move_count == 0
    elsif direction == 'double_up' && @move.piece.nil?
      @moves << @move
    elsif @move.piece.nil? == false
      @moves << @move unless @move.piece.team == false
    end
  end  

  # def en_passant
  #   @en_passants = []
  #   @en_passants << left_pass if !left.piece.nil? && left.piece.move_count == 1 && left_pass.piece.nil?
  #   @en_passants << right_pass if !right.piece.nil? && right.piece.move_count == 1 && right_pass.piece.nil?
  #   @en_passants.each { |move| @moves << move }
  # end

  # def left_pass
  #   @board.squares[@left.row - 1][@left.column]
  # end

  # def right_pass
  #   @board.squares[@right.row - 1][@right.column]
  # end

  def promote(class_name)
    return if class_name == Pawn || @square.row.zero? == false

    @square.piece = class_name.new(@team, @square)
  end
end
