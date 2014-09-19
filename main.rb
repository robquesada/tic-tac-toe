$LOAD_PATH << '.'
require 'game'

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
  self.initialize_game
  self.start_game(option)
end

def initialize_game
  @game = Core::Game.new
end

def start_game(option)
  if option == 1
    @game.play_versus_player
  elsif option == 2
    @game.play_versus_computer
  else
    puts "Press 1 or 2"
  end
  self.print_tictactoe
  self.insert_entry_menu
  self.print_tictactoe
end

def print_tictactoe
  i = 0
  @game.tictactoe.to_a.each do |row|
   puts " #{row[0]}    #{row[1]} | #{row[2]} | #{row[3]}"
   puts " " if i == 0
   puts "    --------------" if i > 0 && i < 3 
   i += 1
  end
end

def insert_entry_menu
  puts "*********************************************"
  puts "Insert the number of the column of your entry"
  puts "1, 2 or 3"
  puts "*********************************************"

  column = gets.to_i

  puts "*********************************************"
  puts "Now, insert the letter of your row"
  puts "A, B or C"
  puts "*********************************************"

  row = gets.to_i
  row = 1 if row == "A"
  row = 2 if row == "B"
  row = 3 if row == "C"

  #@game.player_entry(row, column)
end

self.initial_menu

