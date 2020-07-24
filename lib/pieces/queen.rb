# frozen_string_literal: true

require './lib/piece_factory.rb'
require './lib/modules/movement/queen_moves.rb'

# represents the queen piece in chess
class Queen < PieceFactory
  include QueenMoves

  def find_moves
    @moves = []
    add_moves_for('up')
    add_moves_for('left')
    add_moves_for('right')
    add_moves_for('down')
    add_moves_for('ul_diag')
    add_moves_for('ur_diag')
    add_moves_for('dl_diag')
    add_moves_for('dr_diag')
  end
end
