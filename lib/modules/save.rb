# frozen_string_literal: true

# adds save and load features to the game
module Saveable
  def save_game
    game_state[:board] = @board
    game_state[:teams] = @teams
    game_state[:current_team] = @current_team

    File.open("./lib/save_file.yaml", "w") { |file| file.write(game_state.to_yaml) }
  end

  def load_game

  end
end
