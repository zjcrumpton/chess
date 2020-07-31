# frozen_string_literal: true

require './lib/piece_factory.rb'

# represents the king piece in chess
class King < PieceFactory
  attr_accessor :castles

  def find_moves
    @moves = []
    @castles = []
    add_moves_for('up')
    add_moves_for('left')
    add_moves_for('right')
    add_moves_for('down')
    add_moves_for('ul_diag')
    add_moves_for('ur_diag')
    add_moves_for('dl_diag')
    add_moves_for('dr_diag')
    unless @square.check?
      @team.class == WhiteTeam ? add_white_castles : add_black_castles
    end
    remove_checked_moves
  end

  def moves_for(direction)
    next_move_for(direction)
    return if @move.nil?

    if direction == 'white_castle_left'
      castle_left
    elsif direction == 'white_castle_right'
      castle_right
    elsif direction == 'black_castle_left'
      castle_left_black
    elsif direction == 'black_castle_right'
      castle_right_black
    else
      add_check
      if @move.piece.nil?
        @moves << @move
      else
        @moves << @move unless @move.piece.team == @team
      end
    end
  end

  def add_white_castles
    if @move_count == 0 && @team.current_team?
      add_moves_for('white_castle_left')
      add_moves_for('white_castle_right')
    end
  end

  def add_black_castles
    if @move_count == 0 && @team.current_team?
      add_moves_for('black_castle_left')
      add_moves_for('black_castle_right')
    end
  end

  def castle_left
    return if between_clear?('white_left') == false
    @moves << @move
    @castles << @move
    @rook_move = @board.square_at('d1')
  end

  def castle_right
    return if between_clear?('white_right') == false

    @moves << @move
    @castles << @move
    @rook_move = @board.square_at('f1')
  end

  def castle_left_black
    return if between_clear?('black_left') == false

    @moves << @move
    @castles << @move
    @rook_move = @board.square_at('c1')
  end

  def castle_right_black
    return if between_clear?('black_right') == false

    @moves << @move
    @castles << @move
    @rook_move = @board.square_at('e1')
  end  

  def between_clear?(direction)
    current = @rook_square
    if direction == 'white_left'
      goal = 3
      i = 0
    elsif direction == 'white_right'
      goal = 5
      i = 7
    elsif direction == 'black_left'
      goal = 2
      i = 0
    elsif direction == 'black_right'
      goal = 4
      i = 7
    end

    until i == goal
      if direction == 'white_left' || direction == 'black_left'
        i += 1
      else
        i -= 1
      end
      current = @board.squares[@square.row][i]
      if current.piece.nil? == false || current.check?
        return false
      end
    end
    return true
  end

  def remove_checked_moves
    @moves = @moves.filter { |move| move.check == false}
  end

  def pawn_check
    @board.squares.each do |row|
      row.each do |square|

      end
    end
  end

  def show_checks
    @moves.each do |move|
      puts "#{move.location} Check?: #{move.check?}"
    end
  end

  def check?
    @square.check? == true
  end

  def hard_check?
    @board.refind_moves
    @square.check? == true
  end

  def checkmate?
    @board.refind_moves
    @checkmate = true if check? && @moves.empty?
  end
end
