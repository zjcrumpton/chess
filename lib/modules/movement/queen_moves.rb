
module QueenMoves
  def next_move_for(direction)
    @i += 1
    if direction == 'ul_diag'
      return @move = nil if @board.squares[@square.row - @i].nil?
      return @move = nil if @board.squares[@square.row - @i][@square.column - @i].nil?

      @move = @board.squares[@square.row - @i][@square.column - @i]
    elsif direction == 'dl_diag'
      return @move = nil if @board.squares[@square.row + @i].nil?
      return @move = nil if @board.squares[@square.row + @i][@square.column - @i].nil?

      @move = @board.squares[@square.row + @i][@square.column - @i]
    elsif direction == 'ur_diag'
      return @move = nil if @board.squares[@square.row - @i].nil?
      return @move = nil if @board.squares[@square.row - @i][@square.column - @i].nil?

      @move = @board.squares[@square.row - @i][@square.column + @i]
    elsif direction == 'dr_diag'
      return @move = nil if @board.squares[@square.row + @i].nil?
      return @move = nil if @board.squares[@square.row + @i][@square.column + @i].nil?

      @move = @board.squares[@square.row + @i][@square.column + @i]
    elsif direction == 'up'
      return @move = nil if @board.squares[@square.row - @i].nil?
  
      @move = @board.squares[@square.row - @i][@square.column]
    elsif direction == 'left'
      return @move = nil if @board.squares[@square.row][@square.column - @i].nil?
  
      @move = @board.squares[@square.row][@square.column - @i]
    elsif direction == 'right'
        return @move = nil if @board.squares[@square.row][@square.column + @i].nil?
  
        @move = @board.squares[@square.row][@square.column + @i]
    elsif direction == 'down'
      return @move = nil if @board.squares[@square.row + @i].nil?
  
      @move = @board.squares[@square.row + @i][@square.column]
    end
  end
end
