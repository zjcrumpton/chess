# frozen_string_literal: true

require './lib/piece_factory.rb'
require './lib/modules/movement/bishop_moves.rb'

# represents the bishop piece in chess
class Bishop < PieceFactory
  include BishopMoves
  def find_moves
    @moves = []
    add_moves_for('ul_diag')
    add_moves_for('ur_diag')
    add_moves_for('dl_diag')
    add_moves_for('dr_diag')
  end


end
