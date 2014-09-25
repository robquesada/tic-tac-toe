module Core
  class Game

    attr_accessor :tictactoe, :is_vs_computer, :result

    require 'matrix'

    def initialize
      @tictactoe = Matrix[
        ["_", "1", "2", "3"],
        ["A", " ", " ", " "],
        ["B", " ", " ", " "],
        ["C", " ", " ", " "],
      ]
    end

    def play_versus_player
      @is_vs_computer = false
    end

    def play_versus_computer
      @is_vs_computer = true
    end

    def is_game_over?
      (is_straigth_line_full? || is_diagonal_full? || is_tictactoe_full?) ? true : false
    end

    def is_straigth_line_full?
      is_full = false
      for i in 1..3
        if (@tictactoe[i,1] == @tictactoe[i,2] && @tictactoe[i,2] == @tictactoe[i,3] && @tictactoe[i,1] != " ") ||
           (@tictactoe[1,i] == @tictactoe[2,i] && @tictactoe[2,i] == @tictactoe[3,i] && @tictactoe[1,i] != " ")
          is_full = true
          break
        end
      end
      is_full
    end

    def is_diagonal_full?
      ((@tictactoe[1,1] == @tictactoe[2,2] && @tictactoe[2,2] == @tictactoe[3,3] && @tictactoe[1,1] != " ") ||
      (@tictactoe[1,3] == @tictactoe[2,2] && @tictactoe[2,2] == @tictactoe[3,1] && @tictactoe[1,3] != " ")) ?
      true : false
    end

    def is_tictactoe_full?
      is_full = true
      @tictactoe.each do |entry|
        !(entry == " ") ? true : (is_full = false)
      end
      is_full
    end

    def player_entry(row, column, mark)
      if is_space_empty?(row, column)
        @tictactoe[row, column] << mark
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
      (@tictactoe[row, column] == " ") ? true : false
    end

  end
end
