# frozen_string_literal: true

require 'require_all'
require_relative 'board.rb'
require 'pry'
require_all './lib/teams'

# represents the game of Chess
class Chess
  attr_accessor :board, :teams, :display
  def initialize
    @board = Board.new
    @teams = { white: WhiteTeam.new(@board, true) }
    @teams[:white].current_team = false
    @board.flip!
    @teams[:black] = BlackTeam.new(@board, true)
    @teams[:white].current_team = true
    @teams[:black].current_team = false
    @board.flip!
    start
  end

  def start
    puts "
    #{"ZJCRUMPTON PRESENTS:".green}#{"
    ______    _    _   ______  __    _ 
    | |  | \\ | |  | | | |  | \\ \\ \\  | | 
    | |__| | | |  | | | |--| <  \\_\\_| |
    |_|  \\_\\ \\_|__|_| |_|__|_/  ____|_|".red}
    
    #{"______  _    _   ______  ______   ______ 
    | |     | |  | | | |     / |      / |     
    | |     | |--| | | |---- '------. '------.
    |_|____ |_|  |_| |_|____  ____|_/  ____|_/".blue}
                                                                                    
    \n\n"
    menu_prompt
  end

  def menu_prompt

  end
end
