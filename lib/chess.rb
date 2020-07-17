# frozen_string_literal: true

require 'require_all'
require_relative 'board.rb'
require 'pry'
require_all './lib/teams'

# represents the game of Chess
class Chess
  attr_accessor :board, :teams, :display
  def initialize
    @display = Board.new
    @board = @display.board
    @teams = [WhiteTeam.new(@board), BlackTeam.new(@board)]
  end
end

