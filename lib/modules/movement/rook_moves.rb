# frozen_string_literal: true

# finds valid Rooklike movements
module RookMoves
  def add_moves_for(direction)
    @i = 0
    moves_for(direction)
  end

  def moves_for(direction)
    next_move_for(direction)
    return if @move.nil?

    if @move.piece.nil?
      @moves << @move
      moves_for(direction)
    else
      @moves << @move unless @move.piece.team == @team
    end
  end

  def next_move_for(direction)
    @i += 1
    if direction == 'up'
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
