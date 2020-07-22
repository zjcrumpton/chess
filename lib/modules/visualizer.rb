# frozen_string_literal: true
require 'require_all'
# require '/lib/piece_factory.rb'

# adds display functionality to board
module MoveVisuals
  def show_moves
    find_moves
    print "   a  b  c  d  e  f  g  h\n"
    row_num = 8

    @board.squares.each do |row|
      print "#{row_num} "

      row.each do |square|
        if square.piece.nil?
          @moves.include?(square) ? print(" #{'*'.black} ".colorize(background: square.bg)) : print('   '.colorize(background: square.bg))
        elsif @moves.include?(square) && square.piece.nil? == false
          print square.piece.symbol.to_s.colorize(background: :red)
        elsif square.piece == self
          print "#{@symbol}".colorize(background: :black)
        else
          print "#{square.piece.symbol}".colorize(background: square.bg)
        end
      end
      print " #{row_num}"
      print "\n"
      row_num -= 1
    end
    print "   a  b  c  d  e  f  g  h \n"
  end
end
