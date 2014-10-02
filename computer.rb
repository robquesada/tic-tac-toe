class Computer

  def initialize(game)
    @game = game
  end

  def generate_computer_entry(row_player, col_player)
    blocked_diagonal = block_player_diagonal if is_center_marked?
    if !blocked_diagonal
      (block_player_horizontal(row_player, col_player) ||
       block_player_vertical(row_player, col_player)) ? true : generate_random_entry
    end
  end

  def block_player_diagonal
    corners_to_block = [[[1,1], [3,3]], [[3,3], [1,1]],
                        [[1,3], [3,1]], [[3,1], [1,3]]]
    computer_inserts = [[3,3], [1,1], [3,1], [1,3]]
    for i in 0..3
      if check_spaces_to_block(corners_to_block[i][0], corners_to_block[i][1])
        insert_computer_mark(computer_inserts[i][0], computer_inserts[i][1])
        return true
      else
        false
      end
    end
  end

  def is_center_marked?
    (@game.tictactoe[2,2] == " X") ? true : false
  end

  def block_player_horizontal(row, col)
    spaces_to_move = [[1, 2], [-1, 1], [-1, -2]]
    check_block_player_horizontal(row, col, spaces_to_move[col-1])
  end

  def check_block_player_horizontal(row, col, spaces_to_move)
    if check_spaces_to_block([row, col+spaces_to_move[0]], [row, col+spaces_to_move[1]])
      insert_computer_mark(row, col+spaces_to_move[1])
    elsif check_spaces_to_block([row, col+spaces_to_move[1]], [row, col+spaces_to_move[0]])
      insert_computer_mark(row, col+spaces_to_move[0])
    else
      return false
    end
    true
  end

  def check_spaces_to_block(marked_position, empty_position)
    (@game.tictactoe[marked_position[0], marked_position[1]] == " X" &&
     @game.tictactoe[empty_position[0], empty_position[1]] == " ") ? true : false
  end

  def block_player_vertical(row, col)
    spaces_to_move = [[1, 2], [-1, 1], [-1, -2]]
    check_block_player_vertical(row, col, spaces_to_move[row-1])
  end

  def check_block_player_vertical(row, col, spaces_to_move)
    if check_spaces_to_block([row+spaces_to_move[0], col], [row+spaces_to_move[1], col])
      insert_computer_mark(row+spaces_to_move[1], col)
    elsif check_spaces_to_block([row+spaces_to_move[1], col], [row+spaces_to_move[0], col])
      insert_computer_mark(row+spaces_to_move[0], col)
    else
      return false
    end
    true
  end

  def insert_computer_mark(row, col)
    @game.tictactoe[row, col] << "O"
  end

  def generate_random_entry
    row, col = 1
    loop do
      row = 1 + rand(3)
      col = 1 + rand(3)
      break if @game.is_space_empty?(row, col)
    end
    insert_computer_mark(row, col)
  end

end
