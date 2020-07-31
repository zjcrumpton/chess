# frozen_string_literal: true

require 'require_all'
require_relative 'board.rb'
require './lib/modules/variable_typing.rb'
require './lib/modules/game_logic.rb'
require 'pry'
require_all './lib/teams'

# represents the game of Chess
class Chess
  include VariableTyping
  include Game
  include VerifyInput
  include Messages
  attr_accessor :board, :teams, :display

  def initialize
    @board = Board.new
    set_board
  end

  def switch_team
    white_turn? ? black_turn : white_turn
    flip_board
  end

  def start
    print_title
    start_prompt
  end

  def start_prompt
    print_options('start_menu')
    entry_prompt
    start_choice(ask_for_number)
  end

  def new_game
    name_white_player
    name_black_player
    take_turn
  end

  def take_turn
    loading_animation
    your_turn
    current_check? ? save_king : prompt_player
  end

  #FIX THIS SO OTHER PIECES CAN SAVE THE KING
  def save_king
    current_checkmate?
    type("#{"YOUR KING IS IN CHECK,".red} #{@current_team.name.white}\n")
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
          invalid_input('piece')
          prompt_player
        else
          type("Valid Moves:\n".green)
          @board.piece_at(choice).show_moves
          @from = choice
          move_or_change(@board.piece_at(choice))
        end
      else
        invalid_input('input')
        prompt_player
      end
    end
  end

  def move_or_change(piece)
    puts "Enter coordinates (IE: a4) to select a location.".green
    puts "Enter 1 to choose a different piece.".green
    type('Type your choice here, then press enter: '.yellow)

    choice = gets.chomp

    case choice
    when '1'
      prompt_player
    else
      if valid?(choice)
        valid_move?(choice, piece)
      else 
        invalid_input('input')
        move_or_change(piece)
      end
    end
  end

  def valid?(choice)
    true if choice[0].match(/^[[:alpha:]]$/) && choice[1].match(/[0-9]/) && choice.length == 2
  end

  def valid_move?(choice, piece)
    if piece.moves.include?(@board.square_at(choice)) == false || piece.moves.empty?
      invalid_input('move')
      return move_or_change(piece)
    else 
      piece.move_to(choice)
      @board.display
      switch_team
      if @board.current_king.checkmate?
        current_checkmate?
      else
        @to = choice
        type("Successful move! (#{piece.class}: #{@from} => #{@to}) Flipping board....\n".green)
        take_turn
      end
    end
  end

  def show_captured
    return if @current_team.captured.empty?

    @current_team.show_captured
  end
end
