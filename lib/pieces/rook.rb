# frozen_string_literal: true

require './lib/piece_factory.rb'

# represents the rook piece in chess
class Rook < PieceFactory
  def find_moves
    @moves = []
    @i = 0
    up
    @i = 0
    left
    @i = 0
    right
    @i = 0
    down
    @i = 0
  end

  def up
    @i += 1
    return if @board.squares[@square.row - 1].nil?
    move = @board.squares[@square.row - @i][@square.column]

    unless move.piece.nil?
      @moves << move unless move.piece.team == @team
      return
    else
      @moves << move
      up
    end
    @i = 0
  end

  def left
    @i += 1
    return if @board.squares[@square.row][@square.column - @i].nil?
    move = @board.squares[@square.row][@square.column - @i]
    
    unless move.piece.nil?
      @moves << move unless move.piece.team == @team
      return
    else
      @moves << move
      left
    end
    @i = 0
  end

  def right
    @i += 1
    return if @board.squares[@square.row][@square.column + @i].nil?
    move = @board.squares[@square.row][@square.column + @i]

    unless move.piece.nil?
      @moves << move unless move.piece.team == @team
      return
    else
      @moves << move
      right
    end
    @i = 0
  end

  def down
    @i += 1
    return if @board.squares[@square.row + 1].nil?
    move = @board.squares[@square.row + @i][@square.column]

    unless move.piece.nil?
      @moves << move unless move.piece.team == @team
      return
    else
      @moves << move
      down
    end
    @i = 0
  end

  #TODO: Castling
end
