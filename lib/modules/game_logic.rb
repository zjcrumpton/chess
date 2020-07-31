# frozen_string_literal: true

module Game
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
  end

  # prints out options for the selected menu - menu is based on passed argument
  def print_options(type)
    case type
    when 'start_menu'
      type("Enter 1 to start a new game.\n".green)
      type("Enter 2 to load your saved game.\n\n".green)
    end
  end

  # standard prompt displayed before user is allowed to interact with the program
  def entry_prompt
    type('Type your choice here, then press enter: '.yellow)
  end

  # takes user on the correct path from the start menu, either creating a new game or loading the save
  def start_choice(choice)
    case choice
    when 1
      new_game
    when 2
      puts 'load game'
    else
      invalid_input
    end
  end

  def name_white_player
    type("#{'Player for:'.green} #{'white team'.white} #{'- enter your name: '.yellow}")
    @teams[:white].name = gets.chomp
  end

  def name_black_player
    type("#{'Player for:'.green} #{'black team'.white} #{'- enter your name: '.yellow}")
    @teams[:black].name = gets.chomp
  end
end
