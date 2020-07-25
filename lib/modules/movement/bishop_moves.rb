# frozen_string_literal: true

# finds valid Bishoplike movements
module BishopMoves
  def next_move_for(direction)
    @i += 1
    if direction == 'ul_diag'
      return @move = nil if @board.squares[@square.row - @i].nil?
      return @move = nil if @board.squares[@square.row - @i][@square.column - @i].nil?

      @move = @board.squares[@square.row - @i][@square.column - @i]
      return @move = nil if @move.column > @square.column

      @move = nil if @move.row > @square.row
    elsif direction == 'dl_diag'
      return @move = nil if @board.squares[@square.row + @i].nil?
      return @move = nil if @board.squares[@square.row + @i][@square.column - @i].nil?

      @move = @board.squares[@square.row + @i][@square.column - @i]
      return @move = nil if @move.column > @square.column

      @move = nil if @move.row < @square.row
    elsif direction == 'ur_diag'
      return @move = nil if @board.squares[@square.row - @i].nil?
      return @move = nil if @board.squares[@square.row - @i][@square.column - @i].nil?

      @move = @board.squares[@square.row - @i][@square.column + @i]
      return @move = nil if @move.row > @square.row

      @move = nil if @move.column < @square.column
    elsif direction == 'dr_diag'
      return @move = nil if @board.squares[@square.row + @i].nil?
      return @move = nil if @board.squares[@square.row + @i][@square.column + @i].nil?

      @move = @board.squares[@square.row + @i][@square.column + @i]
      return @move = nil if @move.column < @square.column

      @move = nil if @move.row < @square.row
    end
  end
end
