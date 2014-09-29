$LOAD_PATH << '.'
require 'board'

public

def initial_menu
  print_line(50)
  puts "Welcome to The Tic Tac Toe Game!\n\n"
  puts "Choose an option:\n(1) Player versus Player\n(2) Player versus Computer"
  print_line(50)

  option = gets.to_i
  self.initialize_game
  self.start_game(option)
end

def initialize_game
  @board = Fachade::Board.new
end

def start_game(option)
  checking(option)
  main_menu
end

def checking(option)
  case option
  when 1
    @board.play_versus_player
  when 2
    @board.play_versus_computer
  else
    puts "\nInvalid option. Please, press 1 or 2.\n"
    initial_menu
  end
end

def main_menu
  loop do
    print_tictactoe
    insert_entry_menu
    break if verify_if_game_over
  end
end

def verify_if_game_over
  if @board.is_game_over?
    game_over_menu
    true
  else
    false
  end
end

def game_over_menu
  print_tictactoe
  puts "\n +++++ GAME OVER +++++"
end

def print_tictactoe
  @board.get_tictactoe.to_a.each_with_index do |row, i|
    puts " #{row[0]}    #{row[1]} | #{row[2]} | #{row[3]}"
    puts " " if i == 0
    print_line(18) if i > 0 && i < 3 
  end
end

def print_line(length)
  puts "-" * length
end

def insert_entry_menu
  puts "\nPlayer 1 (X)\n"
  @board.player_entry(get_row.to_i, get_column.to_i, "X")
  if !@board.is_vs_computer && !@board.is_game_over?
    print_tictactoe
    puts "\nPlayer 2 (O)\n"
    @board.player_entry(get_row, get_column, "O")
  end
end

def get_column
  begin
    print_line(50)
    puts "Insert the number of your column\n1, 2 or 3"
    print_line(50)
    col = gets.to_i
  end until validate_entry(col)
  col
end

def get_row
  begin
    print_line(50)
    puts "Insert the letter of your row\nA, B or C"
    print_line(50)
    row = convert_entry(gets.chomp)
  end until validate_entry(row)
  row
end

def validate_entry(entry)
  if is_number?(entry)
    if entry >= 1 && entry <= 3
      true
    else
      puts "\nThat is not a valid entry. Please, try it again.\n"
      false
    end
  else
    puts "\nThat is not a valid entry. Please, try it again.\n"
    false
  end
end

def is_number?(value)
  true if Integer(value) rescue false
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
