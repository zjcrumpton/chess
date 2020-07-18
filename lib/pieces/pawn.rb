# frozen_string_literal: true

require './lib/piece_factory.rb'
require 'pry'

# represents the pawn piece in chess
class Pawn < PieceFactory
  attr_accessor :left, :right
  def find_moves
    find_attacks
    @moves << forward if forward.piece.nil? && !forward.nil?
    @move << @left if !@left.piece.nil? && !@left.nil?
    @move << @right if !@right.piece.nil? && !@right.nil?
  end

  def find_attacks
    @left = @board.squares[@square.row - 1][@square.column - 1]
    @right = @board.squares[@square.row - 1][@square.column - 1]
  end

  def forward
    @board.squares[@square.row - 1][@square.column]
  end
end
