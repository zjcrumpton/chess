# frozen_string_literal: true

require './lib/piece_factory.rb'

# represents the pawn piece in chess
class Pawn < PieceFactory
  def find_moves
    # @board
  end

  def move(column, row)
    @board[row][column].piece = Pawn.new(@symbol, @board)
  end
end

# game.teams[:white].select_piece(a,2)
# convert to algebra notation to array index notation
# then display board with green * characters around any possible move square, red * around enemies you can kill
# prompt for a move, piece on original square becomes nil, new object of proper class instantiated on selected move space, if killing something, add it to the dead pile and new object of your piece spawn on that piece

