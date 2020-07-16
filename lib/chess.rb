# frozen_string_literal: true

require 'require_all'
require './lib/board.rb'
require 'pry'
require_all './lib/teams'

# represents the game of Chess
class Chess
  attr_accessor :board, :teams
  def initialize
    @board = Board.new.board
    @teams = [WhiteTeam.new(@board), BlackTeam.new(@board)]
  end
end
