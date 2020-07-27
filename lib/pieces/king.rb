# frozen_string_literal: true

require './lib/piece_factory.rb'

# represents the king piece in chess
class King < PieceFactory
  def find_moves
    # set_checks
    @moves = []
    add_moves_for('up')
    add_moves_for('left')
    add_moves_for('right')
    add_moves_for('down')
    add_moves_for('ul_diag')
    add_moves_for('ur_diag')
    add_moves_for('dl_diag')
    add_moves_for('dr_diag')
    # remove_checks
  end

  def moves_for(direction)
    next_move_for(direction)
    return if @move.nil?

    if @move.piece.nil?
      @moves << @move
    else
      @moves << @move unless @move.piece.team == @team
    end
  end

  # def remove_checks
  #   @moves.each do |move|
  #     move.check? ? @moves.delete(move) : next
  #   end
  # end

  # def reset_checks
  #   @board.squares.each do |row|
  #     row.each do |square|
  #       square.check = false
  #     end
  #   end
  # end

  # def set_checks
  #   reset_checks
  #   @board.squares.each do |row|
  #     row.each do |square|
  #       if square.piece.nil? || square.piece.team == @team
  #         next
  #       else
  #         if square.piece.moves.nil?
  #           next
  #         else
  #           square.piece.moves.each do |move|
  #             unless square.piece.class == Pawn && move == square.piece.forward
  #               unless square.piece.class == Pawn && move == square.piece.forward
  #                 move.check = true
  #               end
  #             end
  #           end
  #         end
  #       end
  #     end
  #   end
  # end

  # def show_checks
  #   @moves.each do |move|
  #     puts "#{move.location} Check?: #{move.check?}"
  #   end
  # end
end
