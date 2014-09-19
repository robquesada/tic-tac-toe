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
    puts "versus player"
  end

  def play_versus_computer
    puts "versus cpu"
  end

  def player_entry(row, column)
    if is_space_empty?
      @tictactoe[row, column] << "X"
    else
     puts "The space is ocuppied, try in another one"
    end
  end

  def generate_tictactoe
    #todo print it
  end

  def is_space_empty?
    true
  end
  end
end
