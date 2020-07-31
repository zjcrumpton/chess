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
    show_board
    show_captured
    print_options('player_prompt')
    choice = gets.chomp
    if valid?(choice) == false
      invalid_input('input')
      prompt_player
    else
      choice == '1' ? puts('menu') : select_piece(choice)
    end
  end

  def select_piece(choice)
    if valid_piece_at?(choice)
      show_moves(choice)
      @from = choice
      move(@board.piece_at(choice))
    else
      invalid_input('piece')
      prompt_player
    end
  end

  def move(piece)
    print_options('move')
    choice = gets.chomp

    case choice
    when '1'
      prompt_player
    else
      if valid?(choice)
        valid_move?(choice, piece)
      else 
        invalid_input('input')
        move(piece)
      end
    end
  end

  def valid_move?(choice, piece)
    if piece.moves.include?(@board.square_at(choice)) == false || piece.moves.empty?
      invalid_input('move')
      return move(piece)
    else 
      piece.move_to(choice)
      show_board
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

 
end
