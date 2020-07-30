# frozen_string_literal: true

require './lib/board.rb'

# represents a team's pieces and progress
class Team
  attr_accessor :symbols, :name

  def place_pieces
    place_pawns
    place_rooks
    place_knights
    place_bishops
    place_queen
    place_king
  end

  def place_pawns
    @pawn_row.each { |square| square.piece = Pawn.new(self, square) }
  end

  def place_rooks
    @start_row.first.piece = Rook.new(self, @start_row.first)
    @start_row.last.piece = Rook.new(self, @start_row.last)
  end

  def place_knights
    @start_row[1].piece = Knight.new(self, @start_row[1])
    @start_row[6].piece = Knight.new(self, @start_row[6])
  end

  def place_bishops
    @start_row[2].piece = Bishop.new(self, @start_row[2])
    @start_row[5].piece = Bishop.new(self, @start_row[5])
  end

  def place_queen
    @start_row[@queen_square].piece = Queen.new(self, @start_row[@queen_square])
  end

  def place_king
    @start_row[@king_square].piece = King.new(self, @start_row[@king_square])
  end

  def select_piece(square); end

  def current_team?
    @current_team == true
  end

  def show_captured
    print 'Captured: '
    @captured.each do |piece|
      piece.symbol = piece.symbol.colorize(background: :black)
      print piece.symbol
    end
    print "\n"
  end
end
