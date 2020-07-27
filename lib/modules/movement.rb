# frozen_string_literal: true

# finds valid move
module MoveList
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
      return @move = nil if @board.squares[@square.row - @i][@square.column + @i].nil?

      @move = @board.squares[@square.row - @i][@square.column + @i]
      return @move = nil if @move.row > @square.row

      @move = nil if @move.column < @square.column
    elsif direction == 'dr_diag'
      return @move = nil if @board.squares[@square.row + @i].nil?
      return @move = nil if @board.squares[@square.row + @i][@square.column + @i].nil?

      @move = @board.squares[@square.row + @i][@square.column + @i]
      return @move = nil if @move.column < @square.column

      @move = nil if @move.row < @square.row
    elsif direction == 'up'
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
    elsif direction == 'double_up'
      return @move = nil if @board.squares[@square.row - 2].nil?

      @move = @board.squares[@square.row - 2][@square.column]
      @move = nil if @move.row > @square.row
    end
  end
end

module KnightMoves
  def next_move_for(direction)
    if direction == 'up_left'
      return @move = nil if @board.squares[@square.row - 2].nil?
      return @move = nil if @board.squares[@square.row - 2][@square.column - 1].nil?
    
      @move = @board.squares[@square.row - 2][@square.column - 1]
      return @move = nil if @move.row > @square.row
    
      @move = nil if @move.column > @square.column
    elsif direction == 'left_up'
      return @move = nil if @board.squares[@square.row - 1].nil?
      return @move = nil if @board.squares[@square.row - 1][@square.column - 2].nil?
    
      @move = @board.squares[@square.row - 1][@square.column - 2]
      return @move = nil if @move.column > @square.column
    
      @move = nil if @move.row > @square.row
    elsif direction == 'left_down'
      return @move = nil if @board.squares[@square.row + 1].nil?
      return @move = nil if @board.squares[@square.row + 1][@square.column - 2].nil?
    
      @move = @board.squares[@square.row + 1][@square.column - 2]
      return @move = nil if @move.column > @square.column
    
      @move = nil if @move.row < @square.row
    elsif direction == 'down_left'
      return @move = nil if @board.squares[@square.row + 2].nil?
      return @move = nil if @board.squares[@square.row + 2][@square.column - 1].nil?
    
      @move = @board.squares[@square.row + 2][@square.column - 1]
      return @move = nil if @move.column > @square.column
    
      @move = nil if @move.row < @square.row
    elsif direction == 'down_right'
      return @move = nil if @board.squares[@square.row + 2].nil?
      return @move = nil if @board.squares[@square.row + 2][@square.column + 1].nil?
    
      @move = @board.squares[@square.row + 2][@square.column + 1]
      return @move = nil if @move.column < @square.column
    
      @move = nil if @move.row < @square.row
    elsif direction == 'right_down'
      return @move = nil if @board.squares[@square.row + 1].nil?
      return @move = nil if @board.squares[@square.row + 1][@square.column + 2].nil?
    
      @move = @board.squares[@square.row + 1][@square.column + 2]
      return @move = nil if @move.row < @square.row
    
      @move = nil if @move.column < @square.column
    elsif direction == 'right_up'
      return @move = nil if @board.squares[@square.row - 1].nil?
      return @move = nil if @board.squares[@square.row - 1][@square.column + 2].nil?
    
      @move = @board.squares[@square.row - 1][@square.column + 2]
      return @move = nil if @move.row > @square.row
    
      @move = nil if @move.column < @square.column
    elsif direction == 'up_right'
      return @move = nil if @board.squares[@square.row - 2].nil?
      return @move = nil if @board.squares[@square.row - 2][@square.column + 1].nil?
    
      @move = @board.squares[@square.row - 2][@square.column + 1]
      return @move = nil if @move.column < @square.column
    
      @move = nil if @move.row > @square.row
    end
  end
end

