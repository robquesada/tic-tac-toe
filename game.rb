module Core
  class Game

    require 'matrix'

    attr_accessor :tictactoe

    def initialize
      @tictactoe = Matrix[
        ["_", "1", "2", "3"],
        ["A", " ", " ", " "],
        ["B", " ", " ", " "],
        ["C", " ", " ", " "],
      ]
    end

    def is_straigth_line_full?
      for i in 1..3
        if (@tictactoe[i,1] == @tictactoe[i,2] && @tictactoe[i,2] == @tictactoe[i,3] && @tictactoe[i,1] != " ") ||
          (@tictactoe[1,i] == @tictactoe[2,i] && @tictactoe[2,i] == @tictactoe[3,i] && @tictactoe[1,i] != " ")
          return true
        end
      end
      false
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
        true
      else
        false
      end
    end

    def is_space_empty?(row, column)
      (@tictactoe[row, column] == " ") ? true : false
    end

  end
end
