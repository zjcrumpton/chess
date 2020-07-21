# frozen_string_literal: true

require './lib/piece_factory.rb'
require 'pry'

# represents the pawn piece in chess
class Pawn < PieceFactory
  attr_accessor :left, :right, :yeet

  def find_moves
    find_attacks
    @moves << forward if forward.piece.nil?
    @moves.uniq!
  end

  def find_attacks
    @left = @board.squares[@square.row - 1][@square.column - 1]
    @right = @board.squares[@square.row - 1][@square.column + 1]

    if !@left.nil? && !@left.piece.nil?
      @moves << @left if @left.piece.color != @color
    end

    if !@right.nil? && !@right.piece.nil?
      @moves << @right if @right.piece.color != @color
    end
  end

  def forward
    @board.squares[@square.row - 1][@square.column]
  end
end
