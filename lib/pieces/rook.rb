# frozen_string_literal: true

require './lib/piece_factory.rb'
require './lib/modules/movement/rook_moves.rb'

# represents the rook piece in chess
class Rook < PieceFactory
  include RookMoves
  def find_moves
    @moves = []
    add_moves_for('up')
    add_moves_for('left')
    add_moves_for('right')
    add_moves_for('down')
  end
end
