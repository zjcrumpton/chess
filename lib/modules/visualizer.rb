# frozen_string_literal: true
require 'require_all'
# require '/lib/piece_factory.rb'

# adds display functionality to board
module MoveVisuals
  @@row_num = 8

  def show_moves
    find_moves
    print_alpha('top')
    @board.squares.each do |row|
      print_row_num('left')
      print_row(row)
      print_row_num('right')
    end
    print_alpha('bottom')
    @@row_num = 8
  end

  def print_row(row)
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
  end

  def print_alpha(position)
    if position == 'top'
      print "   a  b  c  d  e  f  g  h \n"
    else
      print "   a  b  c  d  e  f  g  h \n"
    end
  end

  def print_row_num(position)
    if position == 'left'
      print "#{@@row_num} "
      @@row_num -= 1
    else
      print " #{@@row_num}\n"
    end
  end
end
