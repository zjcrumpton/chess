# frozen_string_literal: true

module Game
  def flip_board
    @board.flip!
  end

  def white_turn
    @teams[:white].current_team = true
    @teams[:black].current_team = false
    @current_team = @teams[:white]
  end

  def black_turn
    @teams[:white].current_team = false
    @teams[:black].current_team = true
    @current_team = @teams[:black]
  end

  def white_turn?
    true if @current_team == @teams[:white]
  end

  def black_turn?
    true if @current_team == @teams[:black]
  end

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

  def print_options(type)
    case type
    when 'start_menu'
      type("Enter 1 to start a new game.\n".green)
      type("Enter 2 to load your saved game.\n\n".green)
    end
  end

  def entry_prompt
    type('Type your choice here, then press enter: '.yellow)
  end
end
