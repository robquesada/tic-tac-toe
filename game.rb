module Core
  class Game

    attr_accessor :tictactoe, :is_vs_computer

    require 'matrix'

    def initialize
      @tictactoe = Matrix[
        ["_", "1", "2", "3"],
        ["A", " ", " ", " "],
        ["B", " ", " ", " "],
        ["C", " ", " ", " "]
      ]
    end

    def play_versus_player
      @is_vs_computer = false
    end

    def play_versus_computer
      @is_vs_computer = true
    end

    def is_game_over?
      is_over = false
      @tictactoe.to_a.each_with_index do |row, i|
        if "X" == row[1] && "X" == row[2] && "X" == row[3]
          is_over = true
          declare_result
        end
      end
      is_over
    end

    def declare_result
      puts "tie"
    end

    def player_entry(row, column, mark)
      if is_space_empty?(row, column)
        @tictactoe[row, column] << mark
        puts @is_vs_computer
        computer_entry if @is_vs_computer
      else
        puts "The space is ocuppied, try in another one"
      end
    end

    def computer_entry
      row_cpu, column_cpu = 1
      loop do
        row_cpu = generate_random_entry
        column_cpu = generate_random_entry
        break if is_space_empty?(row_cpu, column_cpu)
      end
        @tictactoe[row_cpu, column_cpu] << "O"
    end

    def generate_random_entry
      1 + rand(3)
    end

    def is_space_empty?(row, column)
      true if @tictactoe[row, column] == " "
    end

  end
end
