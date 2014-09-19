$LOAD_PATH << '.'
require 'game'

public

def initial_menu
  print_line(50)
  puts "Welcome to The Tic Tac Toe Game!\n\n"
  puts "Choose an option:"
  puts "(1) Player versus Player"
  puts "(2) Player versus Computer"
  print_line(50)

  option = gets.to_i
  self.initialize_game
  self.start_game(option)
end

def initialize_game
  @game = Core::Game.new
end

def print_line(length)
  puts "-" * length
end

def start_game(option)
  checking(option)
  print_tictactoe
  insert_entry_menu
  print_tictactoe
end

def checking(option)
  case option
  when 1
    @game.play_versus_player
  when 2
    @game.play_versus_computer
  else
    puts "Press 1 or 2"
  end
end

def print_tictactoe
  i = 0
  @game.tictactoe.to_a.each do |row|
   puts " #{row[0]}    #{row[1]} | #{row[2]} | #{row[3]}"
   puts " " if i == 0
   print_line(25) if i > 0 && i < 3 
   i += 1
  end
end

def insert_entry_menu
  @game.player_entry(get_row.to_i, get_column.to_i)
end

def get_column
  print_line(50)
  puts "Now, Insert the number of the column \n 1, 2 or 3"
  print_line(50)
  column = gets.to_i
end

def get_row
  print_line(50)
  puts "Insert the letter of your row"
  puts "A, B or C"
  print_line(50)
  row = convert_entry(gets.chomp)
end

def convert_entry(letter_row)
  case letter_row
  when "A"
    num_row = 1
  when "B"
    num_row = 2
  when "C"
    num_row = 3
  end
end

self.initial_menu
