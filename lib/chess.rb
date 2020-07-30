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
    @board.flip!
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
    type("Enter 2 to load your saved game.\n\n".green)
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
    current_check?
    prompt_player
  end



  def prompt_player
    @board.display
    show_captured
    puts "Enter coordinates (IE: a2) to select a piece.".green
    puts "Enter 1 to see the other options menu.".green
    type('Type your choice here, then press enter: '.yellow)
    choice = gets.chomp

    case choice
    when '1'
      puts 'menu'
      prompt_player
    else
      if valid?(choice)
        if @board.piece_at(choice).nil? || @board.piece_at(choice).team != @current_team
        type("\n#{"INVALID INPUT \n".red}#{'ENTER A VALID PIECE LOCATION!'.yellow}\n")
        else
          type("Valid Moves:\n".green)
          @board.piece_at(choice).show_moves
          move_or_change(@board.piece_at(choice))
        end
      else
      type("\n#{"INVALID INPUT \n".red}#{'ENTER A VALID RESPONSE NEXT TIME!'.yellow}\n")
      prompt_player
      end
    end
  end

  def move_or_change(piece)
    puts "Enter coordinates (IE: a4) to select a location to move to.".green
    puts "Enter 1 to choose a different piece.".green
    type('Type your choice here, then press enter: '.yellow)

    choice = gets.chomp

    case choice
    when '1'
      prompt_player
    else
      if valid?(choice)
        unless piece.moves.include?(choice) || piece.moves.empty? == false
          type("\n#{"INVALID INPUT \n".red}#{'ENTER A VALID PIECE LOCATION!'.yellow}\n")
          return move_or_change(piece)
        else
          piece.move_to(choice)
          puts "Succesful move!\n".green
          @board.display
          type("Flipping board....")
          switch_team
          take_turn
        end
      else
      end
    end
  end

  def valid?(choice)
    true if choice[0].match(/^[[:alpha:]]$/) && choice[1].match(/[0-9]/) && choice.length == 2
  end

  def show_captured
    return if @current_team.captured.empty?

    @current_team.show_captured
  end
end
