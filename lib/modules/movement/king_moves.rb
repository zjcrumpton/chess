# frozen_string_literal: true

module KingMoves
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

# TODO: - Gaurd Clauses to stop king move overflow, look into double gaurd clauses for Queen, Rook, and Knight because of the two axes of movement for these pieces
