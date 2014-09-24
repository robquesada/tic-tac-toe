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
      #@computer = Computer.new
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
        generate_computer_entry(row, column) if @is_vs_computer
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

    def generate_computer_entry(row_player, column_player)
      puts "YEEEEP"
      row = row_player
      col = column_player
      if !block_player_horizontal(row, col)
        generate_random_entry
      end
      
      #(block_player_horizontal(row, col) || block_player_vertical(row, col) ||
      # block_player_diagonal(row, col)) ? true : generate_random_entry
    end

    def block_player_diagonal(row, col)
      #Check 2,2
      if row == 2 && col == 2
        row = 2
        col = 2
      else
        false
      end
    end

    def block_player_horizontal(row, col)
      inserted = true
      case col
      when 1
        if @tictactoe[row, col+1] == " X" && @tictactoe[row, col+2] == " "
          @tictactoe[row, col+2] << "O"
        elsif @tictactoe[row, col+1] == " " && @tictactoe[row, col+2] == " X"
          @tictactow[row, col+1] << "O"
        else
          inserted = false
        end
      when 2
        if @tictactoe[row, col-1] == " X" && @tictactoe[row, col+1] == " "
          @tictactoe[row, col+1] << "O"
        elsif @tictactoe[row, col-1] == " " && @tictactoe[row, col+1] == " X"
          @tictactow[row, col-1] << "O"
        else
          inserted = false
        end
      when 3
        if @tictactoe[row, col-1] == " X" && @tictactoe[row, col-2] == " "
          @tictactoe[row, col-2] << "O"
        elsif @tictactoe[row, col-1] == " " && @tictactoe[row, col-2] == " X"
          @tictactow[row, col-1] << "O"
        else
          inserted = false
        end
      end
      inserted
    end

    def block_player_vertical(row, col)
      case row
      when 1
        row += 1
      when 2

      when 3
        row -= 1
        col += 1
      else
        false
      end
    end

    def generate_random_entry
      1 + rand(3)
    end

    def is_space_empty?(row, column)
      (@tictactoe[row, column] == " ") ? true : false
    end

  end
end
