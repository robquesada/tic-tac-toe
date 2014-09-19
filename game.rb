module Core
  class Game

    attr_accessor :tictactoe

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

    end

    def play_versus_computer
      puts "versus cpu"
    end

    def is_game_over?
      @tictactoe.to_a.each_with_index do |row, i|
        true if " " != row[1] && " " != row[2] && " " != row[3]
      end
    end

    def declare_winner
      "tie"
    end

    def player_entry(row, column)
      if is_space_empty?(row, column)
        @tictactoe[row, column] << "X"
      else
        puts "The space is ocuppied, try in another one"
      end
    end

    def is_space_empty?(row, column)
      true if @tictactoe[row, column] == " "
    end

  end
end
