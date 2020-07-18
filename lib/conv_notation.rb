# frozen_string_literal: true

module ConvNotation
  def convert(board, column, row)
    column = case column
            when 'a'
              0
            when 'b'
              1
            when 'c'
              2
            when 'd'
              3
            when 'e'
              4
            when 'f'
              5
            when 'g'
              6
            when 'h'
              7
            end
    row = case row
          when 8
            0 
          when 7
            1
          when 6
            2
          when 5
            3
          when 4
            4
          when 3
            5
          when 2
            6
          when 1
            7
          end
    board.squares[row][column]
  end
end
