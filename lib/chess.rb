# frozen_string_literal: true

require 'require_all'
require_relative 'board.rb'
require './lib/modules/variable_typing.rb'
require 'pry'
require_all './lib/teams'

# represents the game of Chess
class Chess
  include VariableTyping
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
  end

  def start
    type("#{"ZJCRUMPTON PRESENTS:".green}", 'mid')
    print "
    #{"______    _    _   ______  __    _ 
    | |  | \\ | |  | | | |  | \\ \\ \\  | | 
    | |__| | | |  | | | |--| <  \\_\\_| |
    |_|  \\_\\ \\_|__|_| |_|__|_/  ____|_|".red}
    
    #{"______   _    _   ______  ______   ______ 
    | |     | |  | | | |     / |      / |     
    | |     | |--| | | |---- '------. '------.
    |_|____ |_|  |_| |_|____  ____|_/  ____|_/".blue}
                                                                                    
    \n\n"
    menu_prompt
  end

  def menu_prompt
    type("Enter 1 to start a new game.\n".green, 'fast')
    type("Enter 2 to load your saved game.\n".green, 'fast')
    type("Enter 3 to see the rules.\n\n", 'fast')

    type("Type your choice here, then press enter: ", 'fast')
    user_input = gets.chomp
  end
end


