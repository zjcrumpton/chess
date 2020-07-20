# frozen_string_literal: true

require './lib/board.rb'

# represents a team's pieces and progress
class Team
  def place_pieces
    place_pawns
    place_rooks
    place_knights
    place_bishops
    place_queen
    place_king
  end

  def place_pawns
    # binding.pry
    @pawn_row.each { |square| square.piece = Pawn.new(@symbols[:pawn], self, square) }
  end

  def place_rooks
    @start_row.first.piece = Rook.new(@symbols[:rook], self, @start_row.first)
    @start_row.last.piece = Rook.new(@symbols[:rook], self, @start_row.last)
  end

  def place_knights
    @start_row[1].piece = Knight.new(@symbols[:knight], self, @start_row[1])
    @start_row[6].piece = Knight.new(@symbols[:knight], self, @start_row[6])
  end

  def place_bishops
    @start_row[2].piece = Bishop.new(@symbols[:bishop], self, @start_row[2])
    @start_row[5].piece = Bishop.new(@symbols[:bishop], self, @start_row[5])
  end

  def place_queen
    @start_row[@queen_square].piece = Queen.new(@symbols[:queen], self, @start_row[@queen_square])
  end

  def place_king
    @start_row[@king_square].piece = King.new(@symbols[:king], self, @start_row[@king_square])
  end

  def select_piece(square); end
end
