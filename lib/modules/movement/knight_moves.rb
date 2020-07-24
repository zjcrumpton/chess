# frozen_string_literal: true

# finds valid Rooklike movements
module KnightMoves
  def next_move_for(direction)
    if direction == 'up_left'
      return @move = nil if @board.squares[@square.row - 2].nil?
      return @move = nil if @board.squares[@square.row - 2][@square.column - 1].nil?

      @move = @board.squares[@square.row - 2][@square.column - 1]
      return @move = nil if @move.row > @square.row
    elsif direction == 'left_up'
      return @move = nil if @board.squares[@square.row - 1].nil?
      return @move = nil if @board.squares[@square.row - 1][@square.column - 2].nil?

      @move = @board.squares[@square.row - 1][@square.column - 2]
      return @move = nil if @move.column > @square.column
    elsif direction == 'left_down'
      return @move = nil if @board.squares[@square.row + 1].nil?
      return @move = nil if @board.squares[@square.row + 1][@square.column - 2].nil?

      @move = @board.squares[@square.row + 1][@square.column - 2]
      return @move = nil if @move.column > @square.column
    elsif direction == 'down_left'
      return @move = nil if @board.squares[@square.row + 2].nil?
      return @move = nil if @board.squares[@square.row + 2][@square.column - 1].nil?

      @move = @board.squares[@square.row + 2][@square.column - 1]
      return @move = nil if @move.column > @square.column
    elsif direction == 'down_right'
      return @move = nil if @board.squares[@square.row + 2].nil?
      return @move = nil if @board.squares[@square.row + 2][@square.column + 1].nil?

      @move = @board.squares[@square.row + 2][@square.column + 1]
      return @move = nil if @move.column < @square.column
    elsif direction == 'right_down'
      return @move = nil if @board.squares[@square.row + 1].nil?
      return @move = nil if @board.squares[@square.row + 1][@square.column + 2].nil?

      @move = @board.squares[@square.row + 1][@square.column + 2]
      return @move = nil if @move.row < @square.row
    elsif direction == 'right_up'
      return @move = nil if @board.squares[@square.row - 1].nil?
      return @move = nil if @board.squares[@square.row - 1][@square.column + 2].nil?

      @move = @board.squares[@square.row - 1][@square.column + 2]
      return @move = nil if @move.row > @square.row
    elsif direction == 'up_right'
      return @move = nil if @board.squares[@square.row - 2].nil?
      return @move = nil if @board.squares[@square.row - 2][@square.column + 1].nil?

      @move = @board.squares[@square.row - 2][@square.column + 1]
      return @move = nil if @move.column < @square.column
    end
  end

  def moves_for(direction)
    next_move_for(direction)
    return if @move.nil?

    if @move.piece.nil?
      @moves << @move
    else
      @moves << @move unless @move.piece.team == @team
    end
  end
end
