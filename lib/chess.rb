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
    @current_team = @teams[:white]
    @teams[:white].current_team = false
    @board.flip!
    @teams[:black] = BlackTeam.new(@board)
    @teams[:white].current_team = true
    @teams[:black].current_team = false
    @board.flip!
  end

  def switch_team
    if @current_team == @teams[:white]
      @teams[:white].current_team = false
      @teams[:black].current_team = true
      @current_team = @teams[:black]
    else
      @teams[:white].current_team = true
      @teams[:black].current_team = false
      @current_team = @teams[:white]
    end
  end

  def start
    type("\nZJCRUMPTON PRESENTS:".green.to_s, 'mid')
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
    type("Enter 1 to start a new game.\n".green)
    type("Enter 2 to load your saved game.\n".green)
    type("Enter 3 to see the rules.\n\n".green)

    type('Type your choice here, then press enter: '.yellow)
    user_choice(gets.chomp.to_i)
  end

  def user_choice(choice)
    case choice
    when 1
      new_game
    when 2
      puts 'load game'
    when 3
      puts 'rules'
    else
      invalid_input
    end
  end

  def invalid_input
    type("\n#{"INVALID INPUT \n".red}#{'ENTER A VALID RESPONSE: '.yellow}")
    user_choice(gets.chomp.to_i)
  end

  def new_game
    type("You chose: NEW GAME\n\n".green)
    init_players
    take_turn
  end

  def init_players
    type("#{'Player for:'.green} #{'white team'.white} #{'- enter your name: '.yellow}")
    @teams[:white].name = gets.chomp
    type("#{'Player for:'.green} #{'black team'.white} #{'- enter your name: '.yellow}")
    @teams[:black].name = gets.chomp
  end

  def take_turn
    type("\n#{"It's".green} #{@current_team.name.white}#{'\'s turn:'.green}\n\n")
    prompt_player
  end

  def prompt_player
    @board.display
    show_captured
    puts "Enter coordinates (IE: a2) to select a piece.".green
    puts "Enter 1 to open the options menu.".green
    type('Type your choice here, then press enter: '.yellow)
    choice = gets.chomp

    case choice
    when '1'
      puts 'menu'
      prompt_player
    else
      if choice[0].match(/^[[:alpha:]]$/) && choice[1].match(/[0-9]/)
      puts 'yeet'
      # @board.piece_at(choice).show_moves
      else
      type("\n#{"INVALID INPUT \n".red}#{'ENTER A VALID RESPONSE NEXT TIME!'.yellow}\n")
      prompt_player
      end
    end
  end

  def show_captured
    return if @current_team.captured.empty?

    @current_team.show_captured
  end
end
