# frozen_string_literal: true

# finds valid Rooklike movements
module RookMoves
  def next_move_for(direction)
    @i += 1
    if direction == 'up'
      return @move = nil if @board.squares[@square.row - @i].nil?

      @move = @board.squares[@square.row - @i][@square.column]
      @move = nil if @move.row > @square.row
    elsif direction == 'left'
      return @move = nil if @board.squares[@square.row][@square.column - @i].nil?

      @move = @board.squares[@square.row][@square.column - @i]
      @move = nil if @move.column > @square.column
    elsif direction == 'right'
      return @move = nil if @board.squares[@square.row][@square.column + @i].nil?

      @move = @board.squares[@square.row][@square.column + @i]
      @move = nil if @move.column < @square.column
    elsif direction == 'down'
      return @move = nil if @board.squares[@square.row + @i].nil?

      @move = @board.squares[@square.row + @i][@square.column]
      @move = nil if @move.row < @square.row
    end
  end
end
