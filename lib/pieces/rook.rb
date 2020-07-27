# frozen_string_literal: true

require './lib/piece_factory.rb'

# represents the rook piece in chess
class Rook < PieceFactory
  def find_moves
    @moves = []
    add_moves_for('up')
    add_moves_for('left')
    add_moves_for('right')
    add_moves_for('down')
  end
end
