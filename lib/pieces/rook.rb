# frozen_string_literal: true

require './lib/piece_factory.rb'

# represents the rook piece in chess
class Rook < PieceFactory
  def find_moves
    forward
  end

  def forward
    @board.squares.each do |row|
      row.each { |square| square.row < @square.row && square.column == @square.column && square.piece.nil? ? @moves << square : next}
    end
  end
end
