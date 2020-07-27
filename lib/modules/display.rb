# frozen_string_literal: true

require 'require_all'
require_all './lib/teams'
require_all './lib/pieces'

# adds display functionality to board
module Display
  # sets the starting row number to 8
  @@row_num = 8

  def display
    print_alpha('top')
    @squares.each do |row|
      print_row_num('left')
      print_row(row)
      print_row_num('right')
    end
    print_alpha('bottom')
    @@row_num = 8 # resets row_num for the next time display is called
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

  def print_row(row)
    row.each do |square|
      if square.piece.nil?
        print '   '.colorize(background: square.bg)
      else
        print square.piece.symbol.to_s.colorize(background: square.bg)
      end
    end
  end
end
