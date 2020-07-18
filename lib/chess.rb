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

  def piece_at(square)
    return convert(@board, square).piece
  end

  def square_at(square)
    return convert(@board, square)
  end
end

chess = Chess.new
chess.board.display
chess.square_at('b3').piece = Pawn.new(chess.teams[:black].symbols[:Pawn], chess.teams[:black], chess.convert(chess.board, 'b3'))
# chess.piece_at('a7').move_to('b3')
chess.board.display

