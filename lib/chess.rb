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
  attr_accessor :board, :teams, :display, :choice

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

  def save_king
    if current_checkmate?
      game_over
    else
      type("#{'YOUR KING IS IN CHECK,'.red} #{@current_team.name.white}\n\n\n")
      # @board.refind_moves
      prompt_player
    end
  end

  def prompt_player
    show_board
    show_captured
    print_options('player_prompt')
    @choice = gets.chomp

    if valid_choice?
      @choice == '1' ? puts('menu') : select_piece
    else
      invalid_input('input')
      prompt_player
    end
  end

  def select_piece
    if valid_piece?
      show_moves
      @from = @choice
      pick_move(@board.piece_at(@choice))
    else
      invalid_input('piece')
      prompt_player
    end
  end

  def pick_move(piece)
    print_options('move')
    @choice = gets.chomp
    @piece = piece

    if valid_choice?
      @choice == '1' ? prompt_player : valid_move?
    else
      invalid_input('input')
      pick_move(piece)
    end
  end

  def valid_move?
    return false if @piece.moves.empty?

    valid_m = true if @piece.moves.include?(@board.square_at(@choice))
    invalid_input if valid_m == false
    valid_m == true ? move_piece : pick_move(@piece)
  end

  def move_piece
    if @piece.protect?(@choice)
      @piece.move_to(@choice)
      show_board
      switch_team
      @to = @choice
      type("Successful move! (#{@piece.class}: #{@from} => #{@to}) Flipping board....\n".green)
      take_turn
    else
      protect_king
    end
  end

  def protect_king
    puts 'INVALID MOVE! KEEP YOUR KING OUT OF CHECK!'.red
    save_king
  end
end
