# frozen_string_literal: true
require 'colorize'
require 'pry'

# represents one space on a chess board
class Square
  attr_accessor :piece, :color, :row, :column, :location, :back
  # black and white square unicode characters for board display purposes
  @@colors = {
    white: " #{@piece}  ".colorize(:background => :green),
    black: " #{@piece}  ".colorize(:background => :blue)
  }

  @@color = @@colors[:black]
  @@back = 'blue'
  @@count = 0
  def initialize
    @piece = nil
    toggle_colors
    @row = nil
    @back = @@back
    @color = @@color
    @column = nil
    @location = nil
  end

  def toggle_colors
    if @@count == 8
      @@count = 1
    else
      @@count += 1
      @@color = @@color == @@colors[:black] ? @@colors[:white] : @@colors[:black]
      @@back = @@back == 'blue' ? 'green' : 'blue'
    end
  end
end
