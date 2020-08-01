# frozen_string_literal: true

require 'pry'

module Find
  def find(square)
    square = square.split('')
    column = square[0]
    row = square[1].to_i
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
    @squares[row][column]
  end

  def square_to_alg(square)
    square = square.location.to_s.split('')
    column = square[4].to_i
    row = square[1].to_i
    column = case column
             when 0
              'a'
             when 1
              'b'
             when 2
               'c'
             when 3
               'd'
             when 4
               'e'
             when 5
               'f'
             when 6
               'g'
             when 7
               'h'
            end
    row = case row
          when 0
            '8'
          when 1
            '7'
          when 2
            '6'
          when 3
            '5'
          when 4
            '4'
          when 5
            '3'
          when 6
            '2'
          when 7
            '1'
          end
    "#{column}#{row}"
  end

  def piece_at(square)
    find(square).piece
  end

  def square_at(square)
    find(square)
  end

  def remove_at(square)
    square_at(square).piece = nil
  end

  def current_king
    @squares.each do |row|
      row.each do |square|
        next if square.piece.class != King || square.piece.team.current_team? == false

        return square.piece
      end
    end
  end
end
