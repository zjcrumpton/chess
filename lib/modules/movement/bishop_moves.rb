# frozen_string_literal: true

# finds valid Rooklike movements
module BishopMoves
  def add_moves_for(direction)
    @i = 0
    moves_for(direction)
  end

  def moves_for(direction)
    next_move_for(direction)
    return if @move.nil? 

    if @move.piece.nil?
      @moves << @move
      moves_for(direction) unless @move.edge?
    else
      @moves << @move unless @move.piece.team == @team
    end
  end

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
    end
  end
end
