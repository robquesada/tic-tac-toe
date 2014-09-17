class Game

  require 'matrix'

  tic_tac_toe = Matrix[["", "", ""],["", "", ""]]

  def play_with_user

  end

  def play_with_computer

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
