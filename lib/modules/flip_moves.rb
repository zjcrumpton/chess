# frozen_string_literal: true

require 'pry'

module FlipMoves
  def flip_moves!
    @board.squares.each do |row|
      row.each do |square|
        if square.piece.nil?
          next
        else
          unless square.piece.team == @team
            unless square.piece.moves.nil?
              square.piece.moves.each do |move|
                @moves.delete(move)
                return if @board.squares[switch(move.location[0])].nil?
                return if @board.squares[switch(move.location[0][1])].nil?
                new_move = @board.squares[switch(move.location[0])][move.location[1]]
                if square.piece.class == Pawn && new_move.row == square.row + 1
                  square.piece.forward = new_move
                end
              end
            end
          end
        end
      end
    end
  end

  def switch(coordinate)
    case coordinate
    when 0
      7
    when 1
      6
    when 2
      5
    when 3
      4
    when 4
      3
    when 5
      2
    when 6
      1
    when 7
      0
    end
  end

    

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
  #             if square.piece.class == Pawn
  #               move.check == true unless move == square.piece.double
  #               move.check == true unless move == square.piece.forward
  #             else
  #                 move.check = true
  #             end
  #           end
  #         end
  #       end
  #     end
  #   end
  # end
end

