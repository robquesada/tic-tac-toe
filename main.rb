$LOAD_PATH << '.'
require 'game'
include Game
public

def initial_menu
  puts "********************************"
  puts "Welcome to The Tic Tac Toe Game!"
  puts ""
  puts "Choose an option:"
  puts "(1) Player versus Player"
  puts "(2) Player versus Computer"
  puts "********************************"

  option = gets.to_i
  self.start_game(option)
end

def start_game(option)
  if option == 1
    Game.play_versus_player
  elsif option == 2
    Game.play_versus_computer
  else
    puts "Press 1 or 2"
  end
end

self.initial_menu
