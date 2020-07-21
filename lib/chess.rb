# frozen_string_literal: true

require 'require_all'
require_relative 'board.rb'
require_relative 'conv_notation.rb'
require 'pry'
require_all './lib/teams'

# represents the game of Chess
class Chess
  include ConvNotation
  attr_accessor :board, :teams, :display
  def initialize
    @board = Board.new
    @teams = { white: WhiteTeam.new(@board) }
    @board.flip!
    @teams[:black] = BlackTeam.new(@board)
  end
end

chess = Chess.new
chess.board.display
#  Pawn.new(chess.teams[:black].symbols[:pawn], chess.teams[:black], chess.board.square_at('b3'))
# chess.board.piece_at('a2').move_to('a3')
# chess.board.piece_at('a2').move_to('b7')
# chess.board.display
chess.board.square_at('b3').piece = Pawn.new(chess.teams[:black].symbols[:pawn], chess.teams[:black], chess.board.square_at('b3'))
# chess.board.piece_at('a2').move_to('a3')
chess.board.display
# chess.board.piece_at('a3').move_to('a4')
# chess.board.display
# chess.board.piece_at('a4').move_to('a5')
# chess.board.display
# chess.board.piece_at('a5').move_to('a6')
# chess.board.display
chess.board.piece_at('a2').yeet = 'yacht'
chess.board.piece_at('a2')

chess.board.piece_at('c2').move_to('b3')
chess.board.display

# binding.pry

