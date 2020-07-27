# frozen_string_literal: true

require 'colorize'
require 'pry'

# represents one space on a chess board
class Square
  attr_accessor :piece, :color, :row, :column, :location, :bg, :edge, :check

  @@bg = 'blue'
  @@count = 0
  def initialize
    @piece = nil
    toggle_colors
    @row = nil
    @bg = @@bg.to_sym
    @column = nil
    @location = nil
    @edge = false
    @check = false
  end

  def toggle_colors
    if @@count == 8
      @@count = 1
    else
      @@count += 1
      @@bg = @@bg == 'blue' ? 'green' : 'blue'
    end
  end

  def edge?
    @edge == true
  end

  def check?
    @check == true
  end
end
