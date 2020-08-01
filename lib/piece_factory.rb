# frozen_string_literal: true

require 'colorize'
require './lib/modules/visualizer.rb'
require './lib/modules/movement.rb'

# factory function for creating pieces
class PieceFactory
  include MoveList
  include MoveVisuals
  attr_accessor :moves, :symbol, :team, :square, :move_count, :illegals
  def initialize(team, square)
    @symbol = team.symbols[self.class.to_s.to_sym]
    @team = team
    @board = team.board
    @square = square
    @move_count = 0
    # @illegals = []
    find_moves
  end

  def find_illegals
    @board.refind_moves

    @board.squares.each do |row|
      row.each do |square|
        next if square.piece.nil?
        next if square.piece.team != @team
        square.piece.illegals = []
        square.piece.moves.each do |move|
          current_piece = square.piece
          destination = @board.square_to_alg(move)
          # square.piece.moves.delete(move) unless safe_king?(destination, current_piece)
          current_piece.illegals << move unless safe_king?(destination, current_piece)
        end
      end
    end
  end

  def safe_king?(destination, piece)
    safe = legal?(destination, piece)
    @board.square_at(destination).piece = @the_before
    safe == true ? true : false
  end

  def legal?(destination, piece)
    if @board.current_king.check?
     @the_before = @board.square_at(destination).piece
     new_piece = piece.class.new(team, @board.square_at(destination))
     new_piece.move_count = move_count + 1
     @board.square_at(destination).piece = new_piece
     @board.refind_moves
    end
    return false if @board.current_king.check?
    return true if @board.current_king.check? == false
  end

  def move_to(destination)
    @board.refind_moves
    return unless @moves.include?(@board.square_at(destination))
    if protect?(destination)
      remove_pieces(@board.square_at(destination))
      new_piece = self.class.new(team, @board.square_at(destination))
      new_piece.move_count = move_count + 1
      @board.square_at(destination).piece = new_piece
      @board.refind_moves
      @check = false if self.class == King
    else
      puts("INVALID MOVE! KEEP YOUR KING OUT OF CHECK!".red)
    end
  end

  #FIX THIS
  def protect?(destination)
    safe = protected_king?(destination)
    @board.square_at(destination).piece = @before
    return true if safe == true
  end

  def protected_king?(destination)
    @board.refind_moves
     if @board.current_king.check?
      @before = @board.square_at(destination).piece
      new_piece = self.class.new(team, @board.square_at(destination))
      new_piece.move_count = move_count + 1
      @board.square_at(destination).piece = new_piece
      @board.refind_moves
     end
     return true unless @board.current_king.check?
  end

  def remove_pieces(destination)
    capture(destination)
    @square.piece = nil
    return unless self.class == King
    return unless @castles.include?(destination)
    @rook_square.piece = nil
    @rook_move.piece = Rook.new(@team, @rook_move)
  end

  def capture(destination)
    @team.captured << destination.piece unless destination.piece.nil?
    capture_en_passant(destination) unless @en_passants.nil?
    destination.piece = nil
  end

  def capture_en_passant(destination)
    return unless @en_passants.include?(destination)

    en_passant_piece = @board.squares[destination.row + 1][destination.column]
    @team.captured << en_passant_piece.piece
    en_passant_piece.piece = nil
  end

  def add_moves_for(direction)
    @i = 0
    moves_for(direction)
  end

  def moves_for(direction)
    next_move_for(direction)

    return if @move.nil?

    add_check unless @team.current_team == true

    if @move.piece.nil?
      @moves << @move
      moves_for(direction)
    else
      @moves << @move unless @move.piece.team == @team
    end
  end

  def add_check
    return if @team.class == @board.current_team

    @move.check = true
  end
end
