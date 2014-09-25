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

    def generate_computer_entry(row_player, column_player)
      row = row_player
      col = column_player
      (block_player_horizontal(row, col) || block_player_vertical(row, col) ||
       block_player_diagonal(row, col)) ? true : generate_random_entry
    end

    def block_player_diagonal(row, col)
      inserted = true
      if @tictactoe[2,2] == " X"
        if check_spaces_to_block(1,1,3,3)
          @tictactoe[3,3] << "O"
        elsif check_spaces_to_block(3,3,1,1)
          @tictactoe[1,1] << "O"
        elsif check_spaces_to_block(1,3,3,1)
          @tictactoe[3,1] << "O"
        elsif check_spaces_to_block(3,1,1,3)
          @tictactoe[1,3] << "O"
        else
          inserted = false
        end
      else
        inserted = false
      end
      inserted
    end

    def block_player_horizontal(row, col)
      inserted = true
      case col
      when 1
        if check_spaces_to_block(row, col+1, row, col+2)
          @tictactoe[row, col+2] << "O"
        elsif check_spaces_to_block(row, col+2, row, col+1)
          @tictactoe[row, col+1] << "O"
        else
          inserted = false
        end
      when 2
        if check_spaces_to_block(row, col-1, row, col+1)
          @tictactoe[row, col+1] << "O"
        elsif check_spaces_to_block(row, col+1, row, col-1)
          @tictactoe[row, col-1] << "O"
        else
          inserted = false
        end
      when 3
        if check_spaces_to_block(row, col-1, row, col-2)
          @tictactoe[row, col-2] << "O"
        elsif check_spaces_to_block(row, col-2, row, col-1)
          @tictactoe[row, col-1] << "O"
        else
          inserted = false
        end
      end
      inserted
    end

    def check_spaces_to_block(row_marked, col_marked, row_empty, col_empty)
      (@tictactoe[row_marked, col_marked] == " X" && @tictactoe[row_empty, col_empty] == " ") ? true : false
    end

    def block_player_vertical(row, col)
      inserted = true
      case row
      when 1
        if check_spaces_to_block(row+1, col, row+2, col)
          @tictactoe[row+2, col] << "O"
        elsif check_spaces_to_block(row+2, col, row+1, col)
          @tictactoe[row+1, col] << "O"
        else
          inserted = false
        end
      when 2
        if check_spaces_to_block(row-1, col, row+1, col)
          @tictactoe[row+1, col] << "O"
        elsif check_spaces_to_block(row+1, col, row-1, col)
          @tictactoe[row-1, col] << "O"
        else
          inserted = false
        end
      when 3
        if check_spaces_to_block(row-1, col, row-2, col)
          @tictactoe[row-2, col] << "O"
        elsif check_spaces_to_block(row-2, col, row-1, col)
          @tictactoe[row-1, col] << "O"
        else
          inserted = false
        end
      end
      inserted
    end

    def generate_random_entry
      row, col = 1
      loop do
        row = 1 + rand(3)
        col = 1 + rand(3)
        break if is_space_empty?(row, col)
      end
      @tictactoe[row, col] << "O"
    end

    def is_space_empty?(row, column)
      (@tictactoe[row, column] == " ") ? true : false
    end

  end
end
