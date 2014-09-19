module Core

  class Game

  attr_accessor :tictactoe, :player1, :player2

  require 'matrix'

  def initialize
    @tictactoe = Matrix[
      ["_", "1", "2", "3"],
      ["A", " ", " ", " "],
      ["B", " ", " ", " "],
      ["C", " ", " ", " "]
    ]
    @player1 = "X"
    @player2 = "O"
  end

  def play_versus_player

  end

  def play_versus_computer
    puts "versus cpu"
    rand()
  end

  def is_game_over?
    false
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
    if @tictactoe[row, column] == " "
      true
    else
      false
    end
  end

  end
end
