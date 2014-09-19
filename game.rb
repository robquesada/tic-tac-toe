module Game

  require 'matrix'

  @tic_tac_toe = Matrix[
    ["_", "1", "2", "3"],
    ["a", " ", " ", " "],
    ["b", " ", " ", " "],
    ["c", " ", " ", " "]
  ]

  def play_versus_player
    puts "versus player"
  end

  def play_versus_computer
    puts "versus cpu"
  end

  def player_entry(row, column)
    if is_space_empty?
      entry << tictactoe(row, column)
    else
     puts "The space is ocuppied, try in another one"
    end
  end

  def generate_tictactoe
    #todo print it
  end

  def is_space_empty?

  end
end
