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
    type('ZJCRUMPTON PRESENTS:'.green.to_s, 'mid')
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
    type("Enter 3 to see the rules.\n\n".green, 'fast')

    type('Type your choice here, then press enter: '.yellow, 'fast')
    user_choice(gets.chomp.to_i)
  end

  def user_choice(choice)
    case choice
    when 1
      puts 'new game'
    when 2
      puts 'load game'
    when 3
      puts 'rules'
    else
      invalid_input
    end
  end

  def invalid_input
    type("\n#{"INVALID INPUT \n".red}#{'ENTER A VALID RESPONSE:'.yellow} ", 'fast')
    user_choice(gets.chomp.to_i)
  end
end
