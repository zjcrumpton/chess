# frozen_string_literal: true

require './lib/piece_factory.rb'
require 'pry'

# represents the pawn piece in chess
class Pawn < PieceFactory
  attr_accessor :en_passants

  def find_moves
    find_attacks
    double_move if @square.row == 6
    en_passant if @square.row == 3
    @moves << forward if forward.piece.nil?
    @moves.uniq!
  end

  def find_attacks
    @left_attack = @board.squares[@square.row - 1][@square.column - 1]
    @right_attack = @board.squares[@square.row - 1][@square.column + 1]

    if !@left_attack.nil? && !@left_attack.piece.nil?
      @moves << @left_attack if @left_attack.piece.color != @color
    end

    if !@right_attack.nil? && !@right_attack.piece.nil?
      @moves << @right_attack if @right_attack.piece.color != @color
    end
  end

  def forward
    @board.squares[@square.row - 1][@square.column]
  end

  def double_move
    double = @board.squares[@square.row - 2][@square.column]
    @moves << double
  end

  def en_passant
    @en_passants = []
    @en_passants << left_pass if !left.piece.nil? && left.piece.move_count == 1 && left_pass.piece.nil?
    @en_passants << right_pass if !right.piece.nil? && right.piece.move_count == 1 && right_pass.piece.nil?
    @en_passants.each { |move| @moves << move }
  end

  def left_pass
    @board.squares[@left.row - 1][@left.column]
  end

  def right_pass
    @board.squares[@right.row - 1][@right.column]
  end
end
