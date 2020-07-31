# frozen_string_literal: true

module Game
  def flip_board
    @board.flip!
  end

  def white_turn
    @teams[:white].current_team = true
    @teams[:black].current_team = false
    @current_team = @teams[:white]
  end

  def black_turn
    @teams[:white].current_team = false
    @teams[:black].current_team = true
    @current_team = @teams[:black]
  end

  def white_turn?
    true if @current_team == @teams[:white]
  end

  def black_turn?
    true if @current_team == @teams[:black]
  end
end
