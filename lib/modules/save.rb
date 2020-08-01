# frozen_string_literal: true
require 'yaml'

# adds save and load features to the game
module Saveable
  def save_game
    type("saving...\n".green)
    @game_state[:board] = @board
    @game_state[:teams] = @teams
    @game_state[:current_team] = @current_team
    File.open("./lib/save_file.yaml", "w") { |file| file.write(@game_state.to_yaml) }
    take_turn
  end

  def load_game
    @game_state = YAML.load(File.read("./lib/save_file.yaml"))
    @board = @game_state[:board]
    @teams = @game_state[:teams]
    @current_team = @game_state[:current_team]
    type("loading...\n".green)
    take_turn
  end
end
