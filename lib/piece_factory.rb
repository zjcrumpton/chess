# frozen_string_literal: true

require 'colorize'
require_relative 'conv_notation.rb'

# factory function for creating pieces
class PieceFactory
  include ConvNotation
  attr_accessor :moves, :symbol, :team, :square, :color, :move_count, :left, :right
  def initialize(symbol, team, square)
    @symbol = symbol
    @team = team
    @board = team.board
    @color = team.color
    @square = square
    @left = @board.squares[@square.row][@square.column - 1]
    @right = @board.squares[@square.row][@square.column + 1]
    @moves = []
    @move_count = 0
    find_moves
  end

  def move_to(destination)
    find_moves
    return unless @moves.include?(convert(@board, destination))

    remove_pieces(@board.square_at(destination))
    new_piece = self.class.new(@symbol, team, @board.square_at(destination))
    new_piece.move_count = move_count + 1
    @board.square_at(destination).piece = new_piece
  end

  def remove_pieces(destination)
    capture(destination)
    @square.piece = nil
  end

  def capture(destination)
    @team.captured << destination.piece unless destination.piece.nil?
    capture_en_passant(destination) unless @en_passants.nil?
    destination.piece = nil
  end

  def capture_en_passant(destination)
    if @en_passants.include?(destination)
      en_passant_piece = @board.squares[destination.row + 1][destination.column]
      @team.captured << en_passant_piece.piece
      en_passant_piece.piece = nil
    end
  end

  def show_captured
    print 'Captured: '
    @team.captured.each do |piece|
      piece.symbol = piece.symbol.colorize(background: :black)
      puts piece.symbol
    end
  end

  def show_moves
    find_moves
    print "   a  b  c  d  e  f  g  h\n"
    row_num = 8

    @board.squares.each do |row|
      print "#{row_num} "

      row.each do |square|
        if square.piece.nil?
          @moves.include?(square) ? print(" #{'*'.black} ".colorize(background: square.back.to_sym)) : print(square.color)
        elsif @moves.include?(square) && square.piece.nil? == false
          print square.piece.symbol.to_s.colorize(background: :red)
        elsif square.piece == self
          print @symbol.colorize(background: :black)
        else
          print square.piece.symbol.colorize(background: square.back.to_sym)
        end
      end
      print " #{row_num}"
      print "\n"
      row_num -= 1
    end
    print "   a  b  c  d  e  f  g  h \n"
  end
end
