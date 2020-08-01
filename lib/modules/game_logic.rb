# frozen_string_literal: true

# Provides syntax sugar for main game logic
module Game

  # Places pieces on the board
  def set_board
    @teams = { white: WhiteTeam.new(@board, true) }
    @current_team = @teams[:white]
    @teams[:white].current_team = false
    flip_board
    @teams[:black] = BlackTeam.new(@board)
    white_turn
    flip_board
  end

  def show_board
    @board.display
  end

  # Flips the board
  def flip_board
    @board.flip!
  end

  # switches turn to white team
  def white_turn
    @teams[:white].current_team = true
    @teams[:black].current_team = false
    @current_team = @teams[:white]
  end

  # switches turn to black team
  def black_turn
    @teams[:white].current_team = false
    @teams[:black].current_team = true
    @current_team = @teams[:black]
  end

  # checks if current team is the white team
  def white_turn?
    true if @current_team == @teams[:white]
  end

  # checks if current team is the black team
  def black_turn?
    true if @current_team == @teams[:black]
  end

  # prints the whole title card
  def print_title
    type("ZJCRUMPTON PRESENTS:".green.to_s, 'mid')
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
  end

  # prints out options for the selected menu - menu is based on passed argument
  def print_options(type)
    case type
    when 'start_menu'
      type("Enter 1 to start a new game.\n".green)
      type("Enter 2 to load your saved game.\n\n\n".green)
      entry_prompt
    when 'player_prompt'
      puts "Enter coordinates (IE: a2) to select a piece.".green
      puts "Enter 1 to see the other options menu.".green
      entry_prompt
    when 'move'
      puts "Enter coordinates (IE: a4) to select a location.".green
      puts "Enter 1 to choose a different piece.".green
      entry_prompt
    end
  end

  # takes user on the correct path from the start menu, either creating a new game or loading the save
  def start_choice(choice)
    case choice
    when 1
      type("You chose: NEW GAME\n\n".green)
      new_game
    when 2
      type("You chose: LOAD GAME\n\n".green)
      puts 'load game'
    else
      invalid_input('input')
      entry_prompt
      start_choice(ask_for_number)
    end
  end

  # asks player to provide a name for the white team's player
  def name_white_player
    type("#{'Player for:'.green} #{'white team'.white} #{'- enter your name: '.yellow}")
    @teams[:white].name = gets.chomp
  end

  # asks player to provide a name for the black team's player
  def name_black_player
    type("#{'Player for:'.green} #{'black team'.white} #{'- enter your name: '.yellow}")
    @teams[:black].name = gets.chomp
  end

  # prompts user for input then converts it to a number
  def ask_for_number
    gets.chomp.to_i
  end

  def current_check?
    true if @board.current_king.check?
  end

  def current_checkmate?
    if @board.current_king.checkmate?
      game_over
    end
  end

  def show_captured
    return if @current_team.captured.empty?

    @current_team.show_captured
  end

  def remove_mock
    @board.square_at(@choice).piece = nil
  end
end

module Messages
  def game_over
    switch_team
    puts "GAME OVER".red
    type("#{@current_team.name} is the winner.".green)
    switch_team
    type("\nSay goodbye to your kingdom #{@current_team.name}...\n".red)
  end

  # prints crowns for a loading animation
  def loading_animation
    type("#{@teams[:white].symbols[:King]}\n#{@teams[:black].symbols[:King]}\n#{@teams[:white].symbols[:King]}\n#{@teams[:black].symbols[:King]}\n\n")
  end

  # tells the user who's turn it is
  def your_turn
    type("#{"It's".green} #{@current_team.name.white}#{'\'s turn:'.green}\n\n\n")
  end

  # standard prompt displayed before user is allowed to interact with the program
  def entry_prompt
    type('Type your choice here, then press enter: '.yellow)
  end

  def show_moves
    type("Valid Moves:\n".green)
    @board.piece_at(@choice).show_moves
  end
end

# methods for veryifing user is correctly responding
module VerifyInput
  def invalid_input(type)
    case type
    when 'input'
      type("\n#{"INVALID INPUT - ENTER A VALID RESPONSE NEXT TIME!".red}\n")
    when 'piece'
      type("\n#{"INVALID INPUT - ENTER A VALID PIECE LOCATION!".red}\n")
    when 'move'
      type("\n#{"INVALID INPUT - ENTER A VALID MOVE LOCATION!".red}\n")
    end
  end

  def valid_choice?
    if @choice.length == 1
      return true if @choice == '1'
    elsif @choice.length == 2
      return true if @choice[0].match(/[a-h]/) && @choice[1].match(/[0-8]/)
    end
    false
  end

  def valid_piece?
    true if @board.piece_at(@choice).nil? == false && @board.piece_at(@choice).team == @current_team
  end
end
