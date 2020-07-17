# frozen_string_literal: true

# represents one space on a chess board
class Square
  attr_accessor :piece, :color
  # black and white square unicode characters for board display purposes
  @@colors = {
    white: " \u25FC ".encode('utf-8'),
    black: " \u25FB ".encode('utf-8')
  }
  @@color = @@colors[:black]
  @@count = 0

  def initialize
    @piece = nil
    toggle_colors
    @color = @@color
  end

  def toggle_colors
    if @@count == 8
      @@count = 1
    else
      @@count += 1
      @@color = @@color == @@colors[:black] ? @@colors[:white] : @@colors[:black]
    end
  end
end
